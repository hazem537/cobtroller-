from rest_framework import serializers
from cash.models import Cash


class CashSerializer(serializers.ModelSerializer):
    amount =serializers.SerializerMethodField()
    class Meta :
        model =Cash
        fields = ["amount"]
    def get_amount(self,obj):
        return obj.amount+obj.start