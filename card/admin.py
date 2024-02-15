from django.contrib import admin
from .models import Category, ParkingCard, ParkingSession, Subscription,SubscriptionPayment,SubscriptionPackage

admin.site.register(Category)
admin.site.register(ParkingCard)
admin.site.register(ParkingSession)
admin.site.register(Subscription)
admin.site.register(SubscriptionPackage)
admin.site.register(SubscriptionPayment)

