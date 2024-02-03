from django.urls import path
from cash.api.product import ProductView ,ProductsView
from cash.api.cashdetail import CashDetailView,addCashDetail ,add_card_lost , get_cash_detail,add_offer ,remove_card_lost
from cash.api.cash import get_cash_for_shift

urlpatterns = [
    path('products/',ProductsView.as_view()),
   path('product/<int:pk>',ProductView.as_view()),
    path('cash/',get_cash_for_shift),
    
    
    
    path('cashdetail/',CashDetailView.as_view()),
    path("cash_detail/",addCashDetail),
    path("card-lost/",add_card_lost),
    path("card-lost/<int:id>",remove_card_lost),
    path("add-offer/<int:id>",add_offer),
    

    path("cash-detail/<int:id>",get_cash_detail)
    
]