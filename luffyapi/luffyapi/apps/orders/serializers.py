from rest_framework import serializers
from .models import Order, OrderDetail
from datetime import datetime
import random
from django_redis import get_redis_connection
from courses.models import Course, CourseExpire
from django.db import transaction
from coupon.models import UserCoupon
from django.conf import settings


class OrderModelSerializer(serializers.ModelSerializer):

    class Meta:
        model = Order
        fields = [
            "id", "order_title", "total_price",
            "real_price", "order_number", "order_status",
            "pay_type", "credit",
            "coupon", "pay_time",
        ]
        extra_kwargs = {
            "id": {"read_only": True, },
            "order_title": {"read_only": True, },
            "total_price": {"read_only": True, },
            "real_price": {"read_only": True, },
            "order_number": {"read_only": True, },
            "order_status": {"read_only": True, },
            "pay_time": {"read_only": True, },
            "pay_type": {"required": True, },
            "credit": {"required": True, "min_value": 0},
            "coupon": {"required": True, },
        }

    def create(self, validated_data):
        """生成订单"""
        """1. 生成订单记录"""
        # 接受客户端提交的数据
        pay_type = validated_data.get("pay_type")
        credit = validated_data.get("credit", 0)
        coupon = validated_data.get("coupon", 0)
        # 生成必要参数
        user_id = self.context['request'].user.id  # ### 在序列化器中获取视图中的数据，通过self.context来完成的
        order_title = "路飞学城课程购买"
        order_number = datetime.now().strftime("%Y%m%d%H%M%S")+("%06d" % user_id)+("%04d" % random.randint(0,9999))
        order_status = 0  # 未支付

        """2. 再生成订单详情(为了不让订单重复，提出到事务外部进行判断)"""
        # 从redis中提取勾选商品
        redis = get_redis_connection("cart")
        # 从购物车中提取订单信息
        cart_list = redis.hgetall("cart_%s" % user_id)  # 购物车中的有多少商品
        print(1234, cart_list)
        course_set = redis.smembers("selected_%s" % user_id)    # 购物车中勾选了多少商品

        # 如果没有任何勾选的商品，则不能继续下单
        if len(course_set) < 1:
            raise serializers.ValidationError('对不起，当前没有选中任何商品')

        # 生成订单记录
        with transaction.atomic():      # 用事务来避免生成空单
            # 设置SQL语句的回滚点
            save_id = transaction.savepoint()

            order = super().create({
                "order_title": order_title,
                "total_price": 0,  # 等后面生成订单详情的时候，需要循环购物车中商品时，再计算总价格，再填进来
                "real_price": 0,
                "order_number": order_number,
                "order_status": order_status,
                "pay_type": pay_type,
                "credit": credit,
                "coupon": coupon,
                "order_desc": "",
                "user_id": user_id,
                "orders": 0,  # 排序字段
            })

            # 声明订单总价格和订单实价
            total_price = 0

            for course_id_bytes in course_set:
                """在循环中把每一件商品添加订单详情"""
                course_expire_bytes = cart_list[course_id_bytes]
                expire_time = int(course_expire_bytes.decode())
                course_id = int(course_id_bytes.decode())

                try:
                    course = Course.objects.get(pk=course_id)
                except:
                    transaction.savepoint_rollback(save_id)
                    raise serializers.ValidationError("对不起，商品课程不存在！")

                # 提取课程的有效期选项
                try:
                    """有效期选项"""
                    course_expire = CourseExpire.objects.get(expire_time=expire_time, course=course)
                    price = course_expire.price
                except CourseExpire.DoesNotExist:
                    """永久有效"""
                    price = course.price

                # 生成订单详情记录
                try:
                    order_detail = OrderDetail.objects.create(
                        order=order,
                        course=course,
                        expire=expire_time,
                        price=price,
                        real_price=course.real_price(price),
                        discount_name=course.discount_name,
                        orders=0,  # 排序字段
                    )
                except:
                    transaction.savepoint_rollback(save_id)
                    raise serializers.ValidationError('对不起，生成失败，请联系客服人员')

                total_price += float(order_detail.real_price)

            # 保存订单的总价格
            order.total_price = total_price
            # 先默认当前商品总价为实付金额
            order.real_price = total_price
            # 如果使用了优惠券，加入券后实付金额
            if coupon > 0:
                # 1、查找优惠券
                user_coupon = UserCoupon.objects.get(is_show=True, is_delete=False, pk=coupon)
                # 2、判断优惠券是否过期
                start_time = user_coupon.start_time.timestamp()
                now_time = datetime.now().timestamp()
                end_time = start_time + user_coupon.coupon.timer * 24 * 3600
                if now_time < start_time or now_time > end_time:
                    transaction.savepoint_rollback(save_id)
                    raise serializers.ValidationError('对不起，优惠券无法使用，请重新确认使用的优惠券')
                # 3、判断优惠券是否满足使用条件
                if user_coupon.coupon.condition > total_price:
                    transaction.savepoint_rollback(save_id)
                    raise serializers.ValidationError('对不起，优惠券无法使用，请重新确认使用的优惠券')
                # 4、根据优惠券的不同，使用不同方式计算实付金额
                sale_num = float(user_coupon.coupon.sale[1:])
                if user_coupon.coupon.sale[0] == '-':
                    order.real_price = total_price - sale_num
                elif user_coupon.coupon.sale[0] == '*':
                    order.real_price = total_price * sale_num
                # 防止出现无条件使用的优惠券，造成实付金额为负数的请款
                if order.real_price < 0:
                    order.real_price = 0

            # 积分汇算
            if credit > 0:
                # 获取用户积分和总商品价格，进行判断使用的积分是否在合理范围内
                user_credit = self.context['request'].user.credit
                if credit > user_credit or credit/settings.CREDIT_MONEY > total_price:
                    transaction.savepoint_rollback(save_id)
                    raise serializers.ValidationError('对不起，积分换算有误，请重新确认积分数额')
                # 进行积分抵扣
                order.real_price = float('%.2f' % (order.real_price - credit / settings.CREDIT_MONEY))
            order.save()

        """3. 清除掉购物车中勾选的商品"""
        pip = redis.pipeline()
        pip.multi()
        for course_id_bytes in cart_list:
            if course_id_bytes in course_set:
                pip.hdel('cart_%s' % user_id, course_id_bytes)
                pip.srem('selected_%s' % user_id, course_id_bytes)
        pip.execute()

        return order
