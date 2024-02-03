from rest_framework import serializers
from .models import Shift,ShiftDetail
from django.contrib.auth.models import User
from cash.serializers.cash import CashSerializer
# serializer create shift 
#-------------------normal serializers-------------


        

        
       

#------------------user serializer with shift_detail-------------

class ShiftSer (serializers.ModelSerializer):
    class Meta:
        model=Shift
        fields="__all__"
class ShiftDetailSer(serializers.ModelSerializer):
    mainShift=ShiftSer()
    class Meta:
        model=ShiftDetail
        fields=["mainShift"]
        
class UserShiftSerializer (serializers.ModelSerializer):
    shift_detail =ShiftDetailSer()
    class Meta:
        model=User
        fields=['id','username','is_superuser',"shift_detail"]



# --------------shift detail--------------

# ------------------shift --------------------------

        

        