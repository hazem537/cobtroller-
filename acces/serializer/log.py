from rest_framework import serializers
from acces.models import Log
from acces.serializer.machine import MachinesSerializers

class LogSerializer (serializers.ModelSerializer):
    device= serializers.StringRelatedField(source="device.name")
    class Meta:
        model = Log
        fields="__all__"
        
        
        