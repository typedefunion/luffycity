from django.urls import path, re_path
from . import views
from rest_framework_jwt.views import obtain_jwt_token

urlpatterns = [
    path(r'', views.OrderAPIView.as_view()),
]