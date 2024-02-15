from cv2 import createTonemapDrago
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.utils import timezone
from .models import ParkingCard,ParkingSession
# car _ in
# car _ out

@api_view(["POST"])
def time_it_stay(request):
    print(request.data)
    card =ParkingCard.objects.get(num=request.data['card_no'])
    session =getlast_card_in(card.num)    
    duration =timezone.now()  - session.check_in_time 
    hours,reminder = divmod(duration.total_seconds(),3600)
    minutes,_ =divmod(reminder,60)
    print(hours ,minutes )
    return Response("hello")
 
@api_view(["GET"])
def get_data_in (request):
    print(request.data)
    card =ParkingCard.objects.get(num=request.data['card_no'])
    print (card)
    n_session = ParkingSession.objects.create(card= card)
    n_session.save()
    return Response("hello")
# Create your views here.

@api_view(["GET"])
def get_card_transaction_in (request):
    # print(request.data)
    card =ParkingCard.objects.get(num=request.data['card_no'])
    # print (card)
    trans =  ParkingSession.objects.get(card =card)
    print(trans.calc_payment())
    print(trans)

    return Response("hello")
# # Create your views here.

def getlast_card_in(card_number):
    card = ParkingCard.objects.get(num=card_number)
    last_trans = ParkingSession.objects.filter(card=card,check_out_time=None).latest("check_in_time")
    print(last_trans)
    return last_trans


