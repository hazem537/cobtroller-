from rest_framework import generics 
from  card.serializers import category
from card.models import Category
from rest_framework.permissions import IsAuthenticated
from django.db.models import Q

class CategotyList(generics.ListCreateAPIView):
    queryset =Category.objects.all()
    serializer_class =category.Categoryserializer
    permission_classes=[IsAuthenticated]

class CategotyDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset =Category.objects.all()
    serializer_class =category.Categoryserializer
    permission_classes=[IsAuthenticated]

class ShortTermCat (generics.ListCreateAPIView):
    queryset =Category.objects.exclude( Q(isExcept=True) | Q(isSubscription=True) ).exclude(name="lost card")
    serializer_class =category.Categoryserializer
    permission_classes=[IsAuthenticated]

