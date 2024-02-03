from django.urls import path
from .views import ShiftCView,ShiftDView,ShiftDetailUView,DayShiftView,get_active_shift 

from shift.api.shiftdetail import post_end_shift

urlpatterns = [
path("active-shift/",get_active_shift),
path("day-shift/",DayShiftView.as_view()),
path("day-shift/<str:date>",DayShiftView.as_view()),


path("shiftC/",ShiftCView.as_view()),
path("shift/<int:pk>",ShiftDView.as_view()),
path("shift-detail/<int:pk>",ShiftDetailUView.as_view()),
# path("test-shift/",test_shift)
path("end-shift/",post_end_shift)

]
