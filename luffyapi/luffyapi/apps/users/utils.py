from django.contrib.auth.backends import ModelBackend
from .models import User
from django.db.models import Q
from django.conf import settings


def jwt_response_payload_handler(token, user=None, request=None):
    # 自定义登入以后返回的数据
    return {
        'token': token,
        'user_id': user.id,
        'user_credit': user.credit,
        'credit_to_money': settings.CREDIT_MONEY,
        'user_name': user.username
    }


class UsernameMobileAuthBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User.objects.filter(Q(username=username) | Q(mobile=username) | Q(email=username)).first()
        except User.DoesNotExist:
            return None

        if user and user.check_password(password) and self.user_can_authenticate(user):
            return user