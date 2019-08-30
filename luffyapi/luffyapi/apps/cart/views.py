from rest_framework.viewsets import ViewSet
from rest_framework.permissions import IsAuthenticated
from courses.models import Course, CourseExpire
from rest_framework.response import Response
from rest_framework import status
from django_redis import get_redis_connection
from rest_framework.decorators import action
from django.conf import settings

import logging
# 日志起器
log = logging.getLogger('django')




class CartAPIView(ViewSet):
    """读取多条数据"""
    permission_classes = [IsAuthenticated,]

    @action(methods=['POST'], detail=False)
    def add_course(self, request):
        """添加商品到购物车中"""
        """获取用户ID，商品ID，有效期选选项，购物车勾选状态"""
        # 用户ID
        user_id = request.user.id
        # 商品ID
        course_id = request.data.get('course_id')
        # 有效期，用0 表示永久有效
        expire = 0
        # 购物车勾选状态
        is_selected = True

        # 查找和验证数据
        try:
            course = Course.objects.get(is_delete=False, is_show=True, pk=course_id)
        except:
            return Response({'messagge': '对不起，您购买的商品不存在！'}, status=status.HTTP_400_BAD_REQUEST)

        # 添加数据到购物车当中
        try:
            redis = get_redis_connection('cart')
            pip = redis.pipeline()
            pip.multi()

            # 以哈希的格式保存商品信息大购物车中
            pip.hset('cart_%s' % user_id, course_id, expire)
            # 以集合的格式保存商品勾选状态到购物车中
            pip.sadd('selected_%s' % user_id, course_id)
            # 执行管道命令
            pip.execute()

            # 获取当前用户的购物车中商品的数量
            total = redis.hlen('cart_%s' % user_id)
        except:
            log.error('购物车商品添加失败，redis操作出错！')
            return Response({'message': '商品添加失败，请联系客服共组人员'}, status=status.HTTP_507_INSUFFICIENT_STORAGE)

        # 返回购物车的状态信息
        return Response({'message': '添加商品成功！', 'total': total}, status=status.HTTP_201_CREATED)

    @action(methods=['GET'], detail=False)
    def get(self, request):
        """购物车的商品列表"""
        user_id = request.user.id
        redis = get_redis_connection('cart')
        # 仅限于写入时才有事务，读取时出错直接重新读取
        # 从hash里面读取购物车信息
        cart_course_list = redis.hgetall('cart_%s' % user_id)
        # 从set里面读取购物车是否勾选的商品
        cart_selected_list = redis.smembers('selected_%s' % user_id)

        # 如果提取到的购物车商品信息，则直接返回空列表
        if len(cart_course_list) < 1:
            return Response([])

        # 否则我们需要组装商品课程信息返回给客户端
        data = []
        for course_bytes, expire_bytes in cart_course_list.items():
            course_id = course_bytes.decode()
            try:
                course = Course.objects.get(pk=course_id)
            except Course.DoesNotExist:
                # 当前商品不存在
                pass
            # 将购物车的商品信息存放到data中
            data.append({
                'id': course_id,
                'name': course.name,
                'course_img': settings.DOMAIL_IMAGE_URL + course.course_img.url,
                'price': course.real_price(),
                'is_selected': True if course_bytes in cart_selected_list else False,
                'expire_list': course.expire_list,
            })
        return Response(data)

    @action(methods=['PATCH'], detail=False)
    def patch(self, request):
        """切换购物车中的商品勾选状态"""
        # 接收数据username_id,course_id,is_selected
        user_id = request.user.id
        course_id = request.data.get('course_id')
        is_selected = bool(request.data.get('is_selected'))

        # 校验数据
        try:
            course = Course.objects.get(is_show=True, is_delete=False, pk=course_id)
        except:
            return Response({'message': '对不起，您购买的商品不存在！'}, status=status.HTTP_400_BAD_REQUEST)

        # 更新购物车中的商品ID
        try:
            redis = get_redis_connection('cart')
            if is_selected:
                # 往redis的集合中添加商品课程ID
                redis.sadd('selected_%s' % user_id, course_id)
            else:
                # 往redis的集合中删除商品课程ID
                redis.srem('selected_%s' % user_id, course_id)
        except:
            return Response({'message': '购物车数据操作有误'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response({'message': '切换勾选状态成功！'})

    @action(methods=["PUT"], detail=False)
    def put(self, request):
        """切换购物车指定商品的购买有效期"""
        # user_id, course_id, 有效期选项
        user_id = request.user.id
        course_id = request.data.get("course_id")
        expire = request.data.get("expire")
        redis = get_redis_connection("cart")
        redis.hset("cart_%s" % user_id, course_id, expire)
        return Response({"message": "切换有效期选项成功！"})

    @action(methods=['DELETE'], detail=False)
    def delete(self, request):
        """删除购物车中的商品"""
        user_id = request.user.id
        course_id = request.query_params.get('course_id')
        # 校验数据
        try:
            course = Course.objects.get(is_show=True, is_delete=False, pk=course_id)
        except:
            return Response({'message': '对不起，您购买的商品不存在！'}, status=status.HTTP_400_BAD_REQUEST)

        redis = get_redis_connection('cart')
        pip = redis.pipeline()
        pip.multi()
        pip.hdel('cart_%s' % user_id, course_id)
        pip.srem('selected_%s' % user_id, course_id)
        pip.execute()

        return Response({'message': '删除商品成功！'}, status=status.HTTP_204_NO_CONTENT)

    @action(methods=['GET'], detail=False)
    def selected(self, request):
        """获取勾选的商品课程列表"""
        user_id = request.user.id
        redis = get_redis_connection('cart')
        cart_list = redis.hgetall('cart_%s' % user_id)
        selected_set = redis.smembers('selected_%s' % user_id)
        print(2468, cart_list)
        print(1357,selected_set)

        data = []

        for course_id_byte in selected_set:
            print(1111,course_id_byte)
            course_id = course_id_byte.decode()
            try:
                course = Course.objects.get(is_show=True, is_delete=False, pk=course_id)
            except Course.DoesNotExist:
                return Response({'message': '对不起，指定商品不存在'}, status=status.HTTP_400_BAD_REQUEST)

            try:
                course_expire = CourseExpire.objects.get(course=course, expire_time=cart_list.get(course_id_byte))
                expire_text = course_expire.expire_text
                price = course_expire.price
            except CourseExpire.DoesNotExist:
                expire_text = '永久有效'
                price = course.price

            data.append({
                'id': course_id,
                'name': course.name,
                'course_img': settings.DOMAIL_IMAGE_URL + course.course_img.url,
                'expire': expire_text,
                'price': price,
                'real_price': course.real_price(price),
                'discount_name': course.discount_name,
            })

        return Response(data)