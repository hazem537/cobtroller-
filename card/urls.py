from django.urls import path

# from .views import get_data_in,time_it_stay,get_card_transaction_in
from card.api import parkingCard 
from card.api import parkingSession
from card.api import category

urlpatterns = [ 
    path("card/",parkingCard.ParkingCardList.as_view()),
    path("card/<int:pk>",parkingCard.ParkingCardDetail.as_view()),  
    path("car-enter/",parkingSession.car_in),
    path("car-exit/",parkingSession.car_out),
    path("card-lost/",parkingSession.card_lost),
    

    path("session-info/<int:card_no>",parkingSession.get_session_info),
    path("session/<int:session_id>/cat/",parkingSession.update_parking_session_category),
    
    path('category/',category.CategotyList.as_view()),
    path('category/<int:pk>',category.CategotyDetail.as_view()),
    
    path('category-short-term/',category.ShortTermCat.as_view())    
]
