
# from gates.processing import controoler_listner
from shift.utilities import active_shift
import asyncio
from concurrent.futures import thread
from django.http import HttpResponse
from rest_framework import status
from rest_framework import generics
from gates.serializer import gate
from gates.models import Gate
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from rest_framework .decorators import api_view
from rest_framework.response import Response
from c3 import C3

class GateList(generics.ListCreateAPIView):
    queryset=Gate.objects.all()
    serializer_class = gate.GateSerializer
    permission_classes =[IsAdminUser]
    
class GateDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset=Gate.objects.all()
    serializer_class = gate.GateSerializer
    permission_classes=[IsAdminUser]    


@api_view(["GET"])
def test_connect(request,pk):
    gate=Gate.objects.get(pk=pk)
    panel = C3(gate.ip)
    flag= False
    if panel.connect():
        flag=True
        panel.disconnect()    
    if flag:
        return Response({"status":"Valid"},status=status.HTTP_200_OK)
    return Response({"status":"InValid"},status= status.HTTP_200_OK)
    
