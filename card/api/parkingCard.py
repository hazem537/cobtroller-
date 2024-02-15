from rest_framework.decorators import api_view
from rest_framework.permissions import IsAdminUser,IsAuthenticated
from rest_framework.response import Response
from card.serializers.parkingCard import  ParkingCardserializer
from rest_framework import status
from rest_framework import generics
from card.models import ParkingCard
from card.serializers.parkingCard import ParkingCardserializer
from card.paginator import CustomPagination
from card.filter import ParkingCardFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters

class ParkingCardList(generics.ListCreateAPIView):
    serializer_class=ParkingCardserializer
    queryset = ParkingCard.objects.all()
    permission_classes=[IsAuthenticated]
    pagination_class= CustomPagination
    filter_backends=[DjangoFilterBackend,filters.SearchFilter]
    filterset_fields = ['category',]
    search_fields = ['num']

class ParkingCardDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class=ParkingCardserializer
    queryset = ParkingCard.objects.all()
    permission_classes=[IsAuthenticated]


@api_view(["POST"])
def add_card(request):
    try:
        data =request.data
        serializer =ParkingCardserializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message":"adding parcking catrt  Done"},status=status.HTTP_200_OK)
        else:
            return Response({"error":serializer.errors},status=status.HTTP_400_BAD_REQUEST)
                        
    except Exception as e:
        print(e)
        return Response({"error":"un konown error"},status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
    
    
    


