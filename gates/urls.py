from django.urls import path
from gates.api import  gate
urlpatterns = [
    path("gate/",gate.GateList.as_view()),
    path("gate/<int:pk>/",gate.GateDetail.as_view()),    
    path("test-gate/<int:pk>/",gate.test_connect),
    path("open_out/",gate.open_out),
    path("open_in/",gate.open_in)
    
    # path("end/",gate.stop_connect),
    # path("listen-controoler")    
]
