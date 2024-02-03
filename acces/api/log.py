from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from acces.models import Log
from  acces.serializer.log import LogSerializer
from django.core.exceptions import ObjectDoesNotExist

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getLastLogWithCardNumber(request,card_no):
    print(card_no)
    try:
        last_log_in = Log.objects.filter(card_no=card_no ,state=0).latest('time')
    except ObjectDoesNotExist :
        last_log_in=False
    if(last_log_in):
        serializer_log = LogSerializer(instance=last_log_in)
        return Response({"data":serializer_log.data},status=status.HTTP_200_OK)
    else:
        return Response({"error":"this card dont have record  in"},status=status.HTTP_404_NOT_FOUND)
        
 