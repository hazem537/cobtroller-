
from django.db.models.signals import post_save, pre_delete
from card.models import Category, SubscriptionPayment,Category ,Subscription 
from django.dispatch import receiver
from django.utils import timezone
@receiver(post_save, sender=SubscriptionPayment) 
def create_profile(sender, instance:SubscriptionPayment, created, **kwargs):
        if created:
                sub_category,cat_created  =Category.objects.get_or_create(name= "sub",defaults={"isSubscription":True} )
                instance.card.category =sub_category
                instance.card.save()
                new_sub,sub_created = Subscription.objects.get_or_create(card= instance.card)
                if sub_created:
                    new_sub.start_date = timezone.now() 
                    new_sub.end_date = timezone.now() + instance.subscription_package.duration
                else:
                    new_sub.end_date  +=    instance.subscription_package.duration
                
                new_sub.save() 
        else :
            pass       
   

        
  