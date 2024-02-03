from rest_framework import generics

from cash.models import Product
from cash.serializers.product import ProductSerializer

class ProductView (generics.RetrieveUpdateDestroyAPIView):
    serializer_class=ProductSerializer
    queryset= Product.objects.all()
 
class ProductsView (generics.ListCreateAPIView):
    serializer_class =ProductSerializer
    queryset=Product.objects.all()    
