from os import name
from rest_framework import serializers
from card.models import ParkingSession


# data we want in caring in
# time in - gate in - card_no
class ParkingSessionserializer(serializers.ModelSerializer):
    card = serializers.StringRelatedField(source="card.num")
    gate_in = serializers.StringRelatedField(source="gate_in.name")
    gate_out = serializers.StringRelatedField(source="gate_out.name")
    cash =serializers.StringRelatedField(source="cash.amount")
    cashier = serializers.StringRelatedField(source="cashire.username")
    class Meta:
        model = ParkingSession
        fields = "__all__"


class CarEnterSerializer(serializers.Serializer):
    card_num = serializers.CharField()
    gate_id = serializers.CharField()
