from django.shortcuts import render
from rest_framework.views import APIView
from luffyapi.libs.geetest import GeetestLib
from rest_framework.response import Response
from django.conf import settings

from rest_framework.generics import CreateAPIView
from .models import User
from .serializers import UserModelSerializer

from rest_framework import status
import random
from django_redis import get_redis_connection
from luffyapi.libs.yuntongxun.sms import CCP

from rest_framework.generics import ListAPIView
from orders.models import Order
from .serializers import UserOrderModelSerializer
from rest_framework.permissions import IsAuthenticated


class CaptchaAPIView(APIView):
    """验证码"""
    def get(self, request):
        """生成验证码的流水号和状态"""
        gt = GeetestLib(settings.PC_GEETEST_ID, settings.PC_GEETEST_KEY)
        status = gt.pre_process(settings.PC_GEETEST_USER_ID)
        response_str = gt.get_response_str()
        return Response(response_str)

    def post(self,request):
        """二次验证"""
        gt = GeetestLib(settings.PC_GEETEST_ID, settings.PC_GEETEST_KEY)
        challenge = request.data.get(gt.FN_CHALLENGE, "")
        validate = request.data.get(gt.FN_VALIDATE, "")
        seccode = request.data.get(gt.FN_SECCODE, "")

        result = gt.success_validate(challenge, validate, seccode, settings.PC_GEETEST_USER_ID)
        if not result:
            result = gt.failback_validate(challenge, validate, seccode)
        print(result)
        return Response({"status": result})


class UserAPIView(CreateAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = UserModelSerializer


class SMSCodeAPIView(APIView):
    def get(self, request, mobile):
        """发送短信"""
        # 1. 验证手机号格式是否正确，是否注册过
        try:
            User.objects.get(mobile=mobile)
            return Response({'message': '对不起，当前手机号码已经被注册'}, status=status.HTTP_400_BAD_REQUEST)
        except User.DoesNotExist:
            # 如果手机号不存在于数据库中， 则表示没有注册，不进行任何处理
            pass
        # 2. 验证短信的间隔时间
        # 2.1 链接redis
        redis = get_redis_connection('sms_code')
        # 使用get获取指定键的值，如果获取不到，则返回None
        interval = redis.get('exp_%s' % mobile)
        if interval:
            return Response({'message': '对不起，短信发送间隔太短！'}, status=status.HTTP_403_FORBIDDEN)

        # 3. 发送短信
        # 3.1 生成随机的短信验证码
        sms_code = '%06d' % random.randint(0, 999999)

        # 3.3 调用sdk发送短信
        # ccp = CCP()
        # result = ccp.send_template_sms(mobile, [sms_code, settings.SMS_EXPIRE_TIME//60], settings.SMS_TEIMPLATE_ID)

        #####使用celery消息队列来进行异步处理发送短信功能，则3.3部分代码失效######
        # 代替3.3发送短信
        from celery_tasks.sms.tasks import send_sms
        send_sms.delay(mobile, sms_code )


        # 4. 返回发送短信的结果
        # if result == '-1':
        #     return Response({'message': '短信发送失败'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        # else:
        #     # 3.2 保存发送的验证码【手机号码、短信验证码、短信发送间隔时间、短信有效期】
        #     """
        #     字符串
        #         setex sms_手机号 300 短信验证码
        #         setse exp_手机号 60  _
        #     """
        #     # 事务的管道[pipeline是一个管道对象],只能用于写入（不能用来读取）
        #     pipe = redis.pipeline()
        #     pipe.multi()    # 开始事务
        #     redis.setex('sms_%s' % mobile, settings.SMS_EXPIRE_TIME, sms_code)
        #     redis.setex('exp_%s' % mobile, settings.SMS_INTERVAL_TIME, '_')
        #     pipe.execute()   # 执行事务
        #     return Response({'message': '短信发送成功！'}, status=status.HTTP_200_OK)
        return Response({'message': '短信发送成功！'}, status=status.HTTP_200_OK)


class UserOrderAPIView(ListAPIView):
    """用户的订单列表"""
    queryset = Order.objects.all().order_by('-id')
    serializer_class = UserOrderModelSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request, *args, **kwargs):
        # 重写列表查询方法，在数据查询的时候新增当前用户的过滤条件
        queryset = self.filter_queryset(self.get_queryset().filter(user=request.user))

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)

        return Response(serializer.data)