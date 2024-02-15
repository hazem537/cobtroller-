from rest_framework import serializers
from shift.models import Shift, ShiftDetail
from django.contrib.auth.models import User
from cash.serializers.cash import CashSerializer
from shift.serializer.shiftdetail import ShiftDetailRetrive ,ShiftDetailDataSerializer


class ShiftSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shift
        fields = "__all__"


class ShiftCreationSerilaizer(serializers.ModelSerializer):
    class Meta:
        model = Shift
        fields = ["type", "date"]


class ShiftRetreiveSerializer(serializers.ModelSerializer):
    detail = ShiftDetailRetrive(many=True)

    class Meta:
        model = Shift
        fields = "__all__"


class ShiftInfoSerializer(serializers.ModelSerializer):
    car_in = serializers.SerializerMethodField()
    car_out = serializers.SerializerMethodField()
    car_in_detail = serializers.SerializerMethodField()
    car_out_detail = serializers.SerializerMethodField()
    all_cash = serializers.SerializerMethodField()
    detail= ShiftDetailDataSerializer(many=True)
    
    class Meta:
        model = Shift
        fields = [
            "start",
            "end",
            "date",
            "type",
            "car_in",
            "car_in_detail",
            "car_out",
            "car_out_detail",
            "all_cash",
            "detail"
        ]
    def get_car_in(self, obj):
        return obj.car_in()

    def get_car_out(self, obj):
        return obj.car_out()

    def get_car_in_detail(self, obj):
        return obj.car_in_detail()
    
    def get_car_out_detail(self, obj):
        return obj.car_out_detail()

    def get_all_cash(self,obj):
        return obj.all_cash()