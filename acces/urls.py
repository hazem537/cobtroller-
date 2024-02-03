from django.urls import path,include
from acces.views import CustomLoginView,CustomSignUpView,ChangePassword,GetAllUsers
from acces.api.log import getLastLogWithCardNumber 
from .views import MachinesView
urlpatterns = [
   
    # api users
    path('customlogin/',CustomLoginView.as_view(),name="Login"),
    path('customsignup/',CustomSignUpView.as_view(),name="signup"),
    path("change-password/",ChangePassword.as_view(),name="changePassword"),
    path("users/",GetAllUsers.as_view(),name="AllUsers"),
    #api log
    
    path("log/<int:card_no>",getLastLogWithCardNumber),

    #api machines
    path("machines/",MachinesView.as_view(),name="machines"),
    # path('', include(router.urls)),
]
