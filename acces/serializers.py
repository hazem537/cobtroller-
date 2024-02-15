from rest_framework import serializers  
# from acces.models import CashDetail 
from django.contrib.auth .models import User


class CustomLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)

class CustomSignUpSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True)



# class CashDetailSerializer (serializers.ModelSerializer):
#     duration =serializers.SerializerMethodField()
#     total =serializers.SerializerMethodField()
#     machine_in=serializers.StringRelatedField(source="machine_in.name")
#     machine_out=serializers.StringRelatedField(source="machine_out.name")
#     time_in = serializers.DateTimeField()
#     time_out=serializers.DateTimeField()
#     product=serializers.StringRelatedField(source="product.name")
#     class Meta :
#         fields=["id",'card_no','machine_in','machine_out','time_in','time_out','product','product_cost','duration','total']
#         model =CashDetail 
        
#     def get_duration(self, obj):
#         # Access the instance of YourModel and compute the property value
#         return obj.duration    
#     def get_total(self, obj):
#         # Access the instance of YourModel and compute the property value
#         return obj.total    
    
    
# class UserSelaizer (serializers.ModelSerializer):
#     # shift=ShiftDetailForUser()
#     class Meta:
#         fields=["id","username","is_superuser"]
#         model = User


# from .models import  Machines, Place

# class PlaceSerializer (serializers.ModelSerializer):
#     class Meta:
#         model=Place
#         fields="__all__"

