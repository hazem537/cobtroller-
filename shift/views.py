from django.shortcuts import render
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework import status
from django.db import IntegrityError
from .models import Shift,ShiftDetail
from shift.serializer.shift import ShiftRetreiveSerializer,ShiftCreationSerilaizer
# from shift.serializer.shiftdetail import ShiftRetreiveSerializer,ShiftCreationSerilaizer

from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from django.core.exceptions import ObjectDoesNotExist
from rest_framework.decorators import api_view
from shift.utilities import  active_shift , get_client_ip

# @api_view(['GET'])
# def test_shift(request):
#     active_shift(request)

#     return Response("done")


class ShiftCView (generics.CreateAPIView):
    queryset = Shift.objects.filter(start__lte =timezone.now(),end__gte=timezone.now())
    serializer_class =ShiftCreationSerilaizer
    permission_classes=[IsAdminUser]
    
    def create(self,request, *args, **kwargs):
        try:        
           return  super().create(request,*args, **kwargs)
        except IntegrityError as e:
            print(str(e))
            if '23000' == e.args[0]: 
                return Response({"error":"this shift already exist"},status=status.HTTP_400_BAD_REQUEST)
# class ActiveShiftView (generics.ListAPIView):
#     queryset = Shift.objects.filter(start__lte =timezone.now(),end__gte=timezone.now())
#     serializer_class =ShiftRetreiveSerializer
#     permission_classes=[IsAuthenticated]
@permission_classes([IsAdminUser])
@api_view(['GET'])
def get_active_shift (request):
 
    queryset = Shift.objects.filter(start__lte =timezone.now(),end__gte=timezone.now())
    
       
    print (queryset)
    if(queryset.exists()):
        shift_serializer =ShiftRetreiveSerializer(instance=queryset,many=True)
        return Response({"data":shift_serializer.data},status=status.HTTP_200_OK)
    else:
        return Response({"error":"no active shift exist"},status=status.HTTP_404_NOT_FOUND)
        


class DayShiftView (generics.ListAPIView):
    queryset = Shift.objects.filter(date=timezone.now().date())
    serializer_class =ShiftRetreiveSerializer
    permission_classes=[IsAuthenticated]
    def get(self,request,*args, **kwargs):
        try:
            date =self.kwargs.get("date")
        except:
            date=False
        if(date):
                self.queryset = Shift.objects.filter(date =date )
                return super().get(request,*args, **kwargs)   
        
        return super().get(request,*args, **kwargs)
        


class ShiftDView(generics.RetrieveAPIView):
    queryset = Shift.objects.all()
    serializer_class = ShiftRetreiveSerializer
    permission_classes=[IsAuthenticated]
    
from shift.serializer.shiftdetail import ShiftDetailUpdate,ShiftDetailRetrive
    
class ShiftDetailUView(generics.UpdateAPIView):
    queryset = ShiftDetail.objects.all()  
    serializer_class = ShiftDetailUpdate   
    permission_classes=[IsAdminUser]

    def partial_update(self,request, *args, **kwargs):
        try:
            return super().partial_update(request, *args, **kwargs)   
        except IntegrityError  as e:
            print(str(e))
            return Response({"error":"this user already exist in this shift "},status=status.HTTP_400_BAD_REQUEST)




# pass shift 
# end shift 
# pass money next shift  or for admin
# accept it  or pass it to admin
#  details shift started and ended 

