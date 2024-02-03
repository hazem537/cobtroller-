
from rest_framework import serializers
from shift.models import Shift,ShiftDetail
from django.contrib.auth.models import User
from cash.serializers.cash import CashSerializer
from shift.serializer.user import UserSerializer
from acces.serializer.machine import MachinesSerializers





class ShiftDetailUpdate(serializers.ModelSerializer):
    class Meta:
        model=ShiftDetail
        fields=["user"]

class ShiftDetailRetrive(serializers.ModelSerializer):
    user  =UserSerializer()
    machine =MachinesSerializers()
    cash = CashSerializer()
    class Meta:
        model=ShiftDetail
        fields="__all__"        
        
        
# class ShiftDetailRetrive(serializers.ModelSerializer):
#     user  =UserSerializer()
#     machine =serializers.StringRelatedField(source="machime.name")
#     cash = CashSerializer()
#     class Meta:
#         model=ShiftDetail
#         fields="__all__"        
            