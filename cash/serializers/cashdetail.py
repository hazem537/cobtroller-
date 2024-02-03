from rest_framework import serializers
from cash.models import CashDetail


class CashDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = CashDetail
        fields = "__all__"



# for offer view

class CashDetailOfferSerializer(serializers.ModelSerializer):
    cashier = serializers.StringRelatedField()
    machine_in = serializers.StringRelatedField()
    machine_out = serializers.StringRelatedField()
    
    class Meta:
        model = CashDetail
        fields = "__all__"


class addCashDetailSerializer(serializers.ModelSerializer):
    log_id = serializers.IntegerField()

    class Meta:
        model = CashDetail
        fields = [
            "card_no",
            "machine_out",
            "time_out",
            "product",
            "product_cost",
            "duration",
            "total",
            "log_id",
        ]
