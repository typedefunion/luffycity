from django.db import models
from luffyapi.utils.models import BaseModel


# Create your models here.
class BannerInfo(BaseModel):
    # upload_to 设置保存文件的子目录，系统会自动创建，但是当前子目录的父级目录需要开发者手动创建
    img_url = models.ImageField(upload_to='banner', null=True, blank=True, max_length=255, verbose_name='轮播图')
    name = models.CharField(max_length=150, verbose_name='轮播图名称')
    note = models.CharField(max_length=150, verbose_name='备注信息')
    link = models.CharField(max_length=150, verbose_name='轮播图广告地址')

    class Meta:
        db_table = 'ly_banner'
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name

    @property
    def image_url(self):
        return self.img_url.url

    def __str__(self):
        return self.name


class NavInfo(BaseModel):
    '''导航模型类'''
    # 导航位置
    NAV_OPTION = (
        (1, "头部导航"),
        (2, "脚部导航"),
    )
    name = models.CharField(max_length=150, verbose_name='导航名称')
    link = models.CharField(max_length=150, verbose_name='导航链接地址')
    opt = models.SmallIntegerField(choices=NAV_OPTION, default=1, verbose_name="导航位置")

    class Meta:
        db_table = 'ly_nav'
        verbose_name = '导航'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name