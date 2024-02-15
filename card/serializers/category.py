from rest_framework import serializers 
from card.models import Category

class Categoryserializer (serializers.ModelSerializer):
    class Meta:
        model = Category
        fields="__all__"