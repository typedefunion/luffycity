from django.urls import path, re_path
from . import views
from rest_framework_jwt.views import obtain_jwt_token

urlpatterns = [
    path(r'authorizations/', obtain_jwt_token, name='authorizations'),
    path(r'captcha/', views.CaptchaAPIView.as_view()),
    path(r'', views.UserAPIView.as_view()),

]