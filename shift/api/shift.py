from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from shift.utilities import active_shift, end_shift, next_shift,get_active_mainshift

from acces.models import MoneyTransaction
from django.contrib.auth.models import User
from shift.serializer.shift import ShiftInfoSerializer


@api_view(["GET"])
def getShiftInfo(request):
    try:
       shift = get_active_mainshift()
    except Exception as e:
        print(e)
        return Response({"message":str(e)},status=status.HTTP_400_BAD_REQUEST)            
    shiftserializer = ShiftInfoSerializer(instance= shift)
    return  Response({"shift":shiftserializer.data},status=200)
    
    