from django.urls import path, re_path
from . import views

urlpatterns = [
    # 课程分类路由
    path(r'category/', views.CourseCategoryListAPIView.as_view()),
    # 课程信息路由
    path(r'', views.CourseListAPIView.as_view()),
]