from django.db import models
from luffyapi.utils.models import BaseModel
from users.models import User


class Coupon(BaseModel):
    """优惠券"""
    coupon_choices = (
        (1, '减免优惠'),
        (2, '折扣优惠'),
    )
    name = models.CharField(max_length=64, verbose_name="优惠券标题")
    coupon_type = models.SmallIntegerField(choices=coupon_choices, default=1, verbose_name="优惠券类型")
    timer = models.IntegerField(verbose_name="优惠券有效期", default=30, help_text="单位：天")
    condition = models.IntegerField(blank=True, default=0, verbose_name="满足使用优惠券的价格条件")
    sale = models.TextField(verbose_name="优惠公式", help_text="""
        *号开头表示折扣价，例如*0.82表示八二折；<br>
        -号开头表示减免价,例如-10表示在总价基础上减免10元<br>    
        """)

    class Meta:
        db_table = "ly_coupon"
        verbose_name = "优惠券"
        verbose_name_plural = "优惠券"

    def __str__(self):
        return "%s" % self.name


class UserCoupon(BaseModel):
    """用户的优惠券"""
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="coupons", verbose_name="用户")
    coupon = models.ForeignKey(Coupon, on_delete=models.CASCADE, related_name="users", verbose_name="优惠券")
    start_time = models.DateTimeField(verbose_name="优惠策略的开始时间")
    is_use = models.BooleanField(default=False, verbose_name="优惠券是否使用过")

    class Meta:
        db_table = "ly_user_coupon"
        verbose_name = "我的优惠券"
        verbose_name_plural = "我的优惠券"

    def __str__(self):
        return "优惠券:%s,用户:%s" % (self.coupon.name, self.user.username)