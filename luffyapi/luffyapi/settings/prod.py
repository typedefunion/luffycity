"""
Django settings for test1 project.

Generated by 'django-admin startproject' using Django 2.2.3.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os
import sys

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# 让spps设置为系统导包路径
sys.path.insert(0, os.path.join(BASE_DIR, "apps"))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '%2*9d5kx#$m9u_3atq-5-p+u*td998r@mpp-fm191yte_2#&-*'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = [
    'www.wangsijie.club',
    'api.wangsijie.club',
    '127.0.0.1',
]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'corsheaders',
    'rest_framework',
    'xadmin',
    'crispy_forms',
    'reversion',
    # 过滤的组件
    'django_filters',
    # 富文本编辑器的组件
    'ckeditor',     # 只能编辑文本
    'ckeditor_uploader',    # 允许图文编辑的上传图片模块

    'home',
    'users',
    'courses',
    'cart',
    'orders',
    'coupon',
    'payments',
]


# COR跨域资源共享的配置信息
CORS_ORIGIN_WHITELIST = (
    'http://www.wangsijie.club',
)
CORS_ALLOW_CREDENTIALS = False  # 允许ajax跨域请求时携带cookie




MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'luffyapi.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'luffyapi.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'luffy_db',
        'HOST': '127.0.0.1',
        'PORT': 3306,
        'USER': 'root',
        'PASSWORD': '123456',
    }
}


# 设置redis缓存
CACHES = {
    # 默认缓存
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        # 项目上线时,需要调整这里的路径
        "LOCATION": "redis://127.0.0.1:6379/0",

        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
    # 提供给xadmin或者admin的session存储
    "session": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/1",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
    # 提供存储短信验证码
    "sms_code": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/2",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
    # 提供存储购物车信息
    "cart": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/3",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    },
}

# 设置xadmin用户登录时,登录信息session保存到redis
SESSION_ENGINE = "django.contrib.sessions.backends.cache"
# 其别名，必须与上面的xadmin中开头的session保持一致
SESSION_CACHE_ALIAS = "session"



# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

# LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'zh-Hans'

# TIME_ZONE = 'UTC'
TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/


# 访问静态文件的url地址前缀
STATIC_URL = '/static/'
# 设置django的静态文件目录
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "statics")
]

STATIC_ROOT = os.path.join(os.path.dirname(BASE_DIR), 'statics')

# 项目中存储上传文件的根目录[暂时配置]，注意，static目录需要手动创建否则上传文件时报错
MEDIA_ROOT=os.path.join(BASE_DIR,"statics")
# 访问上传文件的url地址前缀
MEDIA_URL ="/media/"

# 日志配置
LOGGING = {
    # 版本号
    'version': 1,
    # 阻止已存在的日志
    'disable_existing_loggers': False,
    # 日志格式，分为全部（错误等级、出错时间、出错模组、出错行数和出错信息）和简单
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(lineno)d %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(module)s %(lineno)d %(message)s'
        },
    },
    # 过滤器，如果请求debug为真，则将debug信息过滤掉(请求成功之类的日志信息)
    'filters': {
        'require_debug_true': {
            '()': 'django.utils.log.RequireDebugTrue',
        },
    },
    # 日志处理，分为控制台输出和存入文件中。参数为等级，过滤器，类型，日志格式
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'filters': ['require_debug_true'],
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
        'file': {
            'level': 'INFO',
            'class': 'logging.handlers.RotatingFileHandler',
            # 日志位置,日志文件名,日志保存目录必须手动创建
            'filename': os.path.join(os.path.dirname(BASE_DIR), "logs/luffy.log"),
            # 日志文件的最大值,这里我们设置300M
            'maxBytes': 300 * 1024 * 1024,
            # 日志文件的数量,设置最大日志数量为10
            'backupCount': 10,
            # 日志格式:详细格式
            'formatter': 'verbose'
        },
    },
    # 日志对象
    'loggers': {
        'django': {
            'handlers': ['console', 'file'],
            'propagate': True,  # 是否让日志信息继续冒泡给其他的日志处理系统
        },
    }
}



# rest_framework配置
REST_FRAMEWORK = {
    # 异自定义常处理
    'EXCEPTION_HANDLER': 'luffyapi.utils.exceptions.custom_exception_handler',
    # 自定义用户认证jwt的配置
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
    ),
}

import datetime
# 设置jwt格式
JWT_AUTH = {
    # 设置jwt的过期时间，可以自己修改时间，支持分、时、天、月、年等。
    'JWT_EXPIRATION_DELTA': datetime.timedelta(days=1),
    # 设置jwt的返回内容
    'JWT_RESPONSE_PAYLOAD_HANDLER': 'users.utils.jwt_response_payload_handler'
}


# auth认证模块采用自定义用户模型【这个配置项只能子啊第一次数据迁移之前进行修改，否则报错】
AUTH_USER_MODEL = 'users.User'   # 格式必须是‘子应用目录名称.模型类名’

# 告知Django使用我们自定义的用户认证后端
AUTHENTICATION_BACKENDS = [
    'users.utils.UsernameMobileAuthBackend',
]

# 极验验证码的配置【Ctrl+shift+U,切换大小写】
PC_GEETEST_ID = "a9feefab99c8d4bbcf0d9e3021048312"
PC_GEETEST_KEY = "aa467ab83be3c44929bc7da76eb88028"
PC_GEETEST_USER_ID = 'test'


# 短信验证码的配置
SMS_ACCOUNTSID = "8aaf07086c282571016c60936d002125"
SMS_ACCOUNTTOKEN = "ea0b808c2ede4e18a96e2a21037b86f8"
SMS_APPID = "8aaf07086c282571016c60936d59212c"
SMS_SERVERIP = "sandboxapp.cloopen.com"

SMS_EXPIRE_TIME = 300
SMS_INTERVAL_TIME = 60
SMS_TEIMPLATE_ID = 1

# 自定义富文本编辑框的功能项(放在同一个列表中的为一个组，编辑器用|隔开)
# CKEDITOR_CONFIGS = {
#     'default': {
#         'toolbar': 'Custom',
#         'toolbar_Custom': [
#             ['Bold', 'Italic', 'Underline'],
#             ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
#             ['Link', 'Unlink'],
#             ['RemoveFormat', 'Source']
#         ]
#     }
# }

# 富文本编辑器ckeditor配置
CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'full',  # 工具条功能，full表示全部工具
        'height': 300,      # 编辑器高度【单位：px】
        # 'width': 300,     # 编辑器宽【一般不设置，怕界面被撑开，出现横向滚动条】
    },
}
CKEDITOR_UPLOAD_PATH = ''  # 上传图片保存路径，留空则调用django的文件上传功能
CKEDITOR_UPLOAD_URL = 'http://api.wangsijie.club'
DOMAIL_IMAGE_URL = 'http://api.wangsijie.club'

# 积分和现金的换算比例【10:1】
CREDIT_MONEY = 10

# 支付宝配置信息
ALIPAY_CONFIG = {
    # "gateway_url": "https://openapi.alipay.com/gateway.do?",  # 真实支付宝网关地址
    "gateway_url": "https://openapi.alipaydev.com/gateway.do?",  # 沙箱支付宝网关地址
    "appid": "2016101400682164",
    "app_notify_url": None,
    "app_private_key_path": os.path.join(os.path.dirname(BASE_DIR), "luffyapi/apps/payments/key/app_private_key.pem"),
    "alipay_public_key_path": os.path.join(os.path.dirname(BASE_DIR), "luffyapi/apps/payments/key/alipay_public_key.pem"),
    "sign_type": "RSA2",
    "debug": False,
    "return_url": "http://www.wangsijie.club/pay/result",
    "notify_url": "http://api.wangsijie.club/pay/result",
}


# 设置订单超时取消的时间[单位： 秒]
ORDER_TIMEOUT = 12 * 60 * 60

# 保利威视频云存储服务
POLYV_CONFIG = {
    "userId": "a971622b88",
    "secretkey": "Z3C7eIO0dr",
    "tokenUrl": "https://hls.videocc.net/service/v1/token",
}