from rest_framework import serializers
from shift.models import Shift,ShiftDetail
from django.contrib.auth.models import User
from cash.serializers.cash import CashSerializer
from shift.serializer.shiftdetail import ShiftDetailRetrive



class ShiftSerializer(serializers.ModelSerializer):
    class Meta:
        model=Shift
        fields="__all__"
        

class ShiftCreationSerilaizer (serializers.ModelSerializer):
    class Meta:
        model=Shift
        fields=['type','date']

class ShiftRetreiveSerializer(serializers.ModelSerializer):
    detail = ShiftDetailRetrive(many=True)
    
    class Meta:
        model=Shift
        fields="__all__"