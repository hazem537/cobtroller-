from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view,schema
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from rest_framework.response import Response
from card.serializers.parkingSession import  CarEnterSerializer, ParkingSessionserializer
from rest_framework import status
from card.models import Category, ParkingCard ,ParkingSession
from gates.models import Gate
import logging 
logger =logging.getLogger(__name__)
@api_view(["POST"])
def car_in(request):
    try:
        data= request.data
        serializer = CarEnterSerializer(data=data)
        if serializer.is_valid():
            card = ParkingCard.objects.get(num=serializer.validated_data['card_num'])
            gate =Gate.objects.get(id =serializer.validated_data["gate_id"])
            new_session = ParkingSession.objects.create(card = card, gate_in=gate)
            shift = active_shift(request)
            if shift:
                new_session.shift_in=shift
            new_session.save()
            # add cam in image 
            session_serializer = ParkingSessionserializer(instance=new_session)
            return Response({"message":session_serializer.data},status=status.HTTP_200_OK)
        else:
            return Response({"eror":"the carhass error"},status=status.HTTP_200_OK)
    
    except Exception as e :
        print(e)
        return Response({"error":f'{e}'},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
import math        
@api_view(["GET"])        
def get_session_info(request,card_no):
    try:
        print(card_no)
        card_num = card_no
        selected_session = ParkingSession.objects.get(card__num =card_num , done = False )
        ParkingSession.calc_time(card_num)
        selected_session.calc_payment()
        selected_session = ParkingSession.objects.get(card__num =card_num , done = False )
        serializer  = ParkingSessionserializer(instance= selected_session)
        print(serializer.data)
        return Response({"session":serializer.data},status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({"message":" this card should not being the parking "},status=status.HTTP_404_NOT_FOUND)  

        
@api_view(["PUT"])
def update_parking_session_category(request,session_id):
    data= request.data
    try:
        selected_parking_session =ParkingSession.objects.get(pk = session_id)
        new_cat= data["cat_id"]
        try:
            new_cat = Category.objects.get(pk=new_cat)
        except Exception as e:
            return Response({"error":str(e)},status=status.HTTP_404_NOT_FOUND)
        selected_parking_session.category=new_cat
        selected_parking_session.calc_payment()
        selected_parking_session= ParkingSession.objects.get(pk = session_id)
        serializer =ParkingSessionserializer(instance=selected_parking_session)
        return Response({"session":serializer.data},status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({"error":str(e)},status=status.HTTP_400_BAD_REQUEST)

from shift.utilities import active_shift        

@api_view(["POST"])
def car_out(request):
    data= request.data
    session_id= data["session_id"]
    try:
        s_session:ParkingSession = get_object_or_404(ParkingSession,pk=session_id)
        print(s_session)
        shift = active_shift(request)
        if(shift):
            
            s_session.cashire=request.user
            s_session.cash = request.user.shift_detail.get(pk=shift.id).cash
            s_session.gate_out = request.user.shift_detail.get(pk=shift.id).machine
            s_session.done=True
            s_session.shift_out=shift
            s_session.save()
            
            session_serializer= ParkingSessionserializer(instance = s_session)
            # make cam take image and save
            from shift.processing import open_out_door
            open_out_door(s_session.gate_out.ip)
            
            return Response({"session":session_serializer.data},status=status.HTTP_200_OK)
    except ParkingSession.DoesNotExist:
        return Response({"message":"this card is already out  "},status=status.HTTP_404_NOT_FOUND)
       
       
    except Exception as e:
        logger.exception(f"ann error occare in carout {e}")
        print(e)    
        return Response({"message":str(e)},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
   

@api_view(["POST"])
def card_lost(request):
    shift = active_shift(request)
    if(shift):
        gate= request.user.shift_detail.get(pk=shift.id).machine
        lost_card_session = ParkingSession.objects.create(lost_card=True,gate_in=gate)
        lost_card_session.calc_payment()
        lost_card_session.cashire=request.user
        lost_card_session.cash = request.user.shift_detail.get(pk=shift.id).cash
        lost_card_session.gate_out = gate
        lost_card_session.done=True
        lost_card_session.shift_out=shift
        lost_card_session.shift_in=shift
        lost_card_session.save()
        session_serializer = ParkingSessionserializer(instance=lost_card_session)
        return Response({"session":session_serializer.data},status=status.HTTP_200_OK)
