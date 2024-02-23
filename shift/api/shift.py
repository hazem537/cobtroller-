from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from shift.models import Shift
from shift.utilities import active_shift, end_shift, next_shift,get_active_mainshift
from rest_framework import generics
from acces.models import MoneyTransaction
from django.contrib.auth.models import User
from shift.serializer.shift import ShiftInfoSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters

@api_view(["GET"])
def getShiftInfo(request):
    try:
       shift = get_active_mainshift()
    except Exception as e:
        print(e)
        return Response({"message":str(e)},status=status.HTTP_400_BAD_REQUEST)            
    shiftserializer = ShiftInfoSerializer(instance= shift)
    return  Response({"shift":shiftserializer.data},status=200)
    
    
    
class MainShiftList(generics.ListAPIView):
    serializer_class=ShiftInfoSerializer
    queryset =Shift.objects.all()
    permission_classes=[IsAuthenticated]
    # pagination_class= CustomPagination
    filter_backends=[DjangoFilterBackend,filters.SearchFilter]
    filterset_fields = ['date',"type"]


    
    
    
    