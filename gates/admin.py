from django.contrib import admin

# Register your models here.
from .models import Place ,Gate
admin.site.register(Place)
admin.site.register(Gate)
