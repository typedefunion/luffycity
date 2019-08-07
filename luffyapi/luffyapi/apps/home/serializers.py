from rest_framework.serializers import ModelSerializer
from .models import BannerInfo

from .models import NavInfo



class BannerInfoSerializer(ModelSerializer):
    """轮播图序列化器"""
    class Meta:
        model = BannerInfo
        fields = ("image_url","link")


class NavInfoModelSerializer(ModelSerializer):
    """导航序列化器"""
    class Meta:
        model = NavInfo
        fields = ['id', 'name', 'link',]