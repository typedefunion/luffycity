from django.shortcuts import render
from rest_framework.views import APIView
from luffyapi.libs.geetest import GeetestLib
from rest_framework.response import Response
from django.conf import settings

from rest_framework.generics import CreateAPIView
from .models import User
from .serializers import UserModelSerializer



# Create your views here.
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