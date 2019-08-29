from django.urls import path, re_path
from . import views
from rest_framework_jwt.views import obtain_jwt_token

urlpatterns = [
    path(r'authorizations/', obtain_jwt_token, name='authorizations'),
    path(r'captcha/', views.CaptchaAPIView.as_view()),
    path(r'', views.UserAPIView.as_view()),
    re_path(r'sms/(?P<mobile>1[3-9]\d{9})/', views.SMSCodeAPIView.as_view()),
    path(r'order/', views.UserOrderAPIView.as_view()),
]