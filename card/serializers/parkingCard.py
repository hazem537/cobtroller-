from rest_framework import serializers 
from card.models import ParkingCard
from card.serializers import subscription 
class ParkingCardserializer (serializers.ModelSerializer):
    # subscription = subscription.SubscriptionSerializer()
    class Meta:
        model = ParkingCard
        fields="__all__"