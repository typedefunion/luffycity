from django.urls import path, re_path
from . import views

urlpatterns = [
    # 课程分类路由
    path(r'category/', views.CourseCategoryListAPIView.as_view()),
    # 专题课程中的课程详情信息路由
    path(r'', views.CourseListAPIView.as_view()),
    # 单个课程中的课程详情信息路由
    re_path(r'(?P<pk>\d+)/', views.CourseRetrieveAPIView.as_view()),
]