from rest_framework.generics import ListAPIView
from .models import CourseCategory, Course
from .serializers import CourseCategoryModelSerializer, CourseModelSerializer

class CourseCategoryListAPIView(ListAPIView):
    """课程分类列表"""
    queryset = CourseCategory.objects.filter(is_show=True, is_delete=False).order_by('orders')
    serializer_class = CourseCategoryModelSerializer


class CourseListAPIView(ListAPIView):
    """课程列表"""
    queryset = Course.objects.filter(is_show=True, is_delete=False).order_by('orders')
    serializer_class = CourseModelSerializer