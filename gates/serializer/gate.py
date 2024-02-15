from  rest_framework import serializers 
from gates.models import Gate


class GateSerializer (serializers.ModelSerializer):
    
    class Meta:
        model= Gate
        fields = "__all__"