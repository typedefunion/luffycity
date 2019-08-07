from django.db import models


class BaseModel(models.Model):
    '''将公共字段提取出来，单独作为一个抽象模型类，不形成单独的表'''
    orders = models.IntegerField(verbose_name='显示顺序')
    is_show = models.BooleanField(verbose_name="是否上架", default=False)
    is_delete = models.BooleanField(verbose_name="逻辑删除", default=False)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updated_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')
    class Meta:
        # 设置当前类为抽象模型, 在数据迁移时，不会为该模型创建新表
        abstract = True