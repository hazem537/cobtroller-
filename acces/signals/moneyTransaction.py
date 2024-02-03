from django.dispatch import receiver
from django.db.models.signals import post_save, post_delete
from django.contrib.auth.models import User
from acces.models import MoneyTransaction, Money
from django.db import transaction


@receiver(post_save, sender=MoneyTransaction)
def craet_money_for_users(sender, instance: MoneyTransaction, created, **kwargs):
    if not created and instance.done:
        try:
            with transaction.atomic():
                if instance.amount <= instance.sender.money.amount:
                    instance.receiver.money.amount += instance.amount
                    instance.receiver.money.save()
                    instance.sender.money.amount -= instance.amount
                    instance.sender.money.save()
        except Exception as e:
            print(e)
