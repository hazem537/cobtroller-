"""
Django settings for core project.

Generated by 'django-admin startproject' using Django 5.0.1.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-2zdrc-=b_gwj*8l6s^h-7lf1$m2z-8p&30w%405#tx#83ulj)$"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]

ROOT_URLCONF = "core.urls"
# CORS_ALLOWED_ORIGINS = [
#     "http://localhost:4200",  # Example: Angular development server
# ]
CORS_ALLOW_ALL_ORIGINS = True

# Allow credentials (cookies, authentication headers)
CORS_ALLOW_CREDENTIALS = True

# Allow all headers
CORS_ALLOW_ALL_HEADERS = True

# Allow all methods
CORS_ALLOW_METHODS = [
    "DELETE",
    "GET",
    "OPTIONS",
    "PATCH",
    "POST",
    "PUT",
]
# CSRF_COOKIE_SAMESITE = "Strict"
# CSRF_COOKIE_SECURE = True 
# Application definition


INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "acces",
    "card",
    "gates",
    "cash",
    "corsheaders",
    "rest_framework_swagger",  # Swagger
    "rest_framework",  # Django rest framework
    "drf_yasg",  # Yet Another Swagger generator
    "django_filters",
    "shift",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    # 'ipware.middleware.IpMiddleware',
]

ROOT_URLCONF = "core.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "core.wsgi.application"
# AUTH_USER_MODEL = 'api.CustomUser'
REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": (
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ),
    "DEFAULT_RENDERER_CLASSES": [
        "rest_framework.renderers.JSONRenderer",
        # Add other renderer classes as needed
    ],
    "DEFAULT_FILTER_BACKENDS": [
        "rest_framework.filters.OrderingFilter",  # Enable ordering filter
        "rest_framework.filters.SearchFilter",  # Enable search filter
        "django_filters.rest_framework.DjangoFilterBackend",  # Enable DjangoFilterBackend
    ],
}
# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases
TIME_ZONE = "UTC"
DATABASES = {
    "default": {
        "ENGINE": "mssql",
        "HOST": "localhost",
        "PORT": "",
        "NAME": "access",
        "USER": "test",
        "PASSWORD": "test",
        "OPTIONS": {
            "driver": "ODBC Driver 17 for SQL Server",  # Adjust the driver name based on your installation
        },
    }
}


# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': BASE_DIR / 'db.sqlite3',
#     }
# }


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "Africa/Cairo"

USE_I18N = False

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = "static/"

# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

# LOGIN_URL="login/"
# LOGIN_REDIRECT_URL="/"
# LOGOUT_REDIRECT_URL="login/"

from datetime import timedelta

# auth simple jwt
SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(days=100),
    "REFRESH_TOKEN_LIFETIME": timedelta(days=100),
    "AUTH_HEADER_TYPES": ("Bearer",),
    "USER_ID_FIELD": "id",
    "USER_ID_CLAIM": "user_id",
}
import os

MEDIA_ROOT = os.path.join(BASE_DIR, "media")
MEDIA_URL = "/media/"

PLACE_NAME = "مستشفي الطيران التخصصي"


import signal
import sys
from django.utils import autoreload

# def handle_reload_signal(sender, **kwargs):
#     # Perform actions when reload signal is received
#     print("Reloading Django application...")
#     cleanup_on_exit(None,None)
    
# autoreload.autoreload_started.connect(handle_reload_signal)

def cleanup_on_exit(signum, frame):
    from shift.processing import PM
    # Perform cleanup tasks here, such as terminating processes
    PM.terminate_all_processes()
    # Optionally, log a message indicating the reason for termination
    print("Application terminated due to signal:", signum)
    sys.exit(0)

# Register signal handlers
signal.signal(signal.SIGTERM, cleanup_on_exit)
signal.signal(signal.SIGINT, cleanup_on_exit)

