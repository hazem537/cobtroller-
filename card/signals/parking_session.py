
from asyncio.proactor_events import _ProactorBaseWritePipeTransport
from django.db.models.signals import post_save, pre_delete
from card.models import Category, SubscriptionPayment,Category ,Subscription ,ParkingSession
from django.db.models import Sum
from django.dispatch import receiver
from django.utils import timezone
from django.db import transaction
@receiver(post_save, sender=ParkingSession) 
def create_profile(sender, instance:ParkingSession, created, **kwargs):
        if created:
                pass 
        else :
            with transaction.atomic():
                if instance.done == True:
                    s_cash = instance.cash
                    total_amount = ParkingSession.objects.filter(cash=s_cash).aggregate(total_amount=Sum('amount_paied'))['total_amount']
                    total_offer =  ParkingSession.objects.filter(cash=s_cash).aggregate(total_offer=Sum('offer'))['total_offer']
                    print(total_amount-total_offer)
                    s_cash.amount=  total_amount -total_offer
                    s_cash.save()
                    
                
                   
   

        
  