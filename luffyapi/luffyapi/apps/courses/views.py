from rest_framework.generics import ListAPIView
from .models import CourseCategory, Course
from .serializers import CourseCategoryModelSerializer, CourseModelSerializer

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter
from .paginations import CustomCourseListPageNumberPagination

from rest_framework.generics import RetrieveAPIView
from .serializers import CourseDetailModelSerializer

from luffyapi.libs.polyv import PolyvPlayer
from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated


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
    # 指定分页器
    pagination_class = CustomCourseListPageNumberPagination


class CourseRetrieveAPIView(RetrieveAPIView):
    """课程详情"""
    queryset = Course.objects.filter(is_show=True, is_delete=False)
    serializer_class = CourseDetailModelSerializer


class PolyvAPIView(APIView):
    """保利威加密视频视图接口"""
    permission_classes = [IsAuthenticated]

    def get(self, request):
        """获取保利威云视频加密播放的token"""
        """接受客户端的请求参数"""
        vid = request.query_params.get("vid")  # 视频播放ID
        remote_addr = request.META.get("REMOTE_ADDR")  # 用户的IP
        user_id = request.user.id      # 用户ID
        user_name = request.user.username  # 用户名
        polyv = PolyvPlayer(
            settings.POLYV_CONFIG["userId"],
            settings.POLYV_CONFIG["secretkey"],
            settings.POLYV_CONFIG["tokenUrl"],
        )

        data = polyv.get_video_token(vid, remote_addr, user_id, user_name)

        return Response(data)
