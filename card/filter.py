import django_filters
from card.models import ParkingCard 

class ParkingCardFilter(django_filters.FilterSet):
    
    class Meta:
        model = ParkingCard
        fields = ['num',"category"]