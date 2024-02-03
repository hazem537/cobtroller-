from django.dispatch import receiver
from django.db.models.signals import post_save,post_delete
from django.contrib.auth.models import User
from acces.models import Money
@receiver(post_save,sender=User)
def craet_money_for_users(sender , instance:User,created, **kwargs):
    if(created):
        new_money =Money.objects.create(user=instance,amount=0)
        new_money.save()