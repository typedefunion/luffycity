from rest_framework.generics import ListAPIView
from .models import CourseCategory, Course
from .serializers import CourseCategoryModelSerializer, CourseModelSerializer

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter


class CourseCategoryListAPIView(ListAPIView):
    """课程分类列表"""
    queryset = CourseCategory.objects.filter(is_show=True, is_delete=False).order_by('orders')
    serializer_class = CourseCategoryModelSerializer



# ### 原来的课程列表
# class CourseListAPIView(ListAPIView):
#     """课程列表"""
#     queryset = Course.objects.filter(is_show=True, is_delete=False).order_by('orders')
#     serializer_class = CourseModelSerializer


# 按条件筛选【分类】展示课程信息
class CourseListAPIView(ListAPIView):
    """课程列表"""
    queryset = Course.objects.filter(is_show=True, is_delete=False).order_by('orders')
    serializer_class = CourseModelSerializer

    # 第一个参数DjangoFilterBackend设置筛选，第二个参数OrderingFilter设置排序
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    # 设置筛选的字段
    filter_fields = ('course_category', )
    # 设置排序的字段(默认，人气，价格)
    ordering_fields = ('id', 'students', 'price')