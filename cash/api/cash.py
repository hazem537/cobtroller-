from django.shortcuts import render
from rest_framework import generics
# Create your views here.
from rest_framework.decorators import api_view,permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from shift.models import Shift
from django.utils import timezone 
from cash.serializers.cash import CashSerializer
from shift.utilities import active_shift
@permission_classes([IsAuthenticated])
@api_view(["GET"])
def get_cash_for_shift(request):
    
    shift = active_shift(request)
    cash=shift.cash
    cash_serializer = CashSerializer(cash)
    return Response({"cash":cash_serializer.data},status=status.HTTP_200_OK)
    





