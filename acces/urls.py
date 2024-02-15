from django.urls import path,include
from acces.views import GetAllUsers
from acces.api import login,signup,changepassword
urlpatterns = [
    path('customlogin/',login.login),
    path('customsignup/',signup.signup),
    path("change-password/",changepassword.change_password),
    path("users/",GetAllUsers.as_view(),name="AllUsers"),
]
