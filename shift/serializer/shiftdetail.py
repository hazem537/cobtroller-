
from rest_framework import serializers
from shift.models import Shift,ShiftDetail
from django.contrib.auth.models import User
from cash.serializers.cash import CashSerializer
from shift.serializer.user import UserSerializer
# from acces.serializer.machine import MachinesSerializers
from gates.serializer import gate




class ShiftDetailUpdate(serializers.ModelSerializer):
    class Meta:
        model=ShiftDetail
        fields=["user"]

class ShiftDetailRetrive(serializers.ModelSerializer):
    user  =UserSerializer(many=True)
    machine =gate.GateSerializer()
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
class ShiftDetailDataSerializer(serializers.ModelSerializer):
    car_in =serializers.SerializerMethodField()
    car_in_detail =serializers.SerializerMethodField()
    car_out =serializers.SerializerMethodField()
    car_out_detail =serializers.SerializerMethodField()
    cash =serializers.StringRelatedField(source="cash.amount")
    user=serializers.StringRelatedField(many=True)
    machine=serializers.StringRelatedField(source="machine.name")
    
    class Meta:
        model= ShiftDetail
        fields=["car_in","car_out","car_in_detail","car_out_detail","cash","user","machine"]
        
    def get_car_in(self,obj):
        return obj.car_in()    
    
    def get_car_in_detail(self,obj):
        return obj.car_in_detail()    
    
    def get_car_out(self,obj):
        return obj.car_out()    
    
    def get_car_out_detail(self,obj):
        return obj.car_out_detail()    
    
    