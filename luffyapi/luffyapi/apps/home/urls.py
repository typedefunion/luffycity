from django.urls import path, re_path
from . import views

urlpatterns = [
    path(r'banner/', views.BannerInfoListAPIView.as_view()),
]