from django.urls import path

from cash.api.cash import get_cash_for_shift

urlpatterns = [

    path('cash/',get_cash_for_shift),
    
    
    
   
    
]