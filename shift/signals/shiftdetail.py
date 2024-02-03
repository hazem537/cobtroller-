from django.dispatch import receiver
from shift.models import ShiftDetail
from django.db.models.signals import post_save
from cash.models import Cash 


@receiver(post_save, sender=ShiftDetail)
def after_create_detail_add_cash(sender,instance,created,  **kwargs):
    if created:
        print(instance.id)
        new_cash = Cash.objects.create(shift=instance,amount=0)
        new_cash.save()
        return new_cash  


    