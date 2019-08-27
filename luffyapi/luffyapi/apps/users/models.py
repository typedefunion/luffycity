from django.db import models
from django.contrib.auth.models import AbstractUser
from luffyapi.utils.models import BaseModel


class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar', blank=True, null=True, verbose_name='头像')
    mobile = models.CharField(max_length=15, unique=True, blank=True, null=True, verbose_name='手机号码')
    credit = models.IntegerField(default=0, verbose_name='贝里')

    class Meta:
        db_table = 'ly_users'
        verbose_name = '用户'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '%s' % self.username


class Credit(BaseModel):
    """积分账单"""
    OPERA_OPION = (
        (1, '赚取'),
        (2, '消费'),
    )
    user = models.ForeignKey('User', related_name='credit_record', on_delete=models.CASCADE, verbose_name='用户')
    opera = models.SmallIntegerField(choices=OPERA_OPION, verbose_name='操作类型')
    number = models.SmallIntegerField(default=0, verbose_name='积分数值')

    class Meta:
        db_table = 'ly_credit'
        verbose_name = '积分流水'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '%s %s %s 贝里' % (self.user.username, self.OPERA_OPION[self.opera][1], self.number)