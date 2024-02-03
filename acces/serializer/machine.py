from rest_framework import serializers  
from acces.models import Machines


class MachinesSerializers(serializers.ModelSerializer):    
    Place= serializers.StringRelatedField(source="Place.name")
    number_in = serializers.SerializerMethodField()
    number_out = serializers.SerializerMethodField()
    
    class Meta:
        model=Machines
        fields=["id","name","Place",'number_in','number_out']
    
    def get_number_in(self,obj):
        return obj.number_in
    
    def get_number_out(self,obj):
        return obj.number_out
    