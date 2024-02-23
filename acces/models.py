from random import choices
from django.db import models
from django.db.models.signals import post_save, pre_delete
from django.dispatch import receiver
from django.contrib.auth.models import User
from django.db.models import Sum,Count
# add car type and how calc values


class Money (models.Model):
    user =  models.OneToOneField(User,related_name= "money", on_delete=models.CASCADE)
    amount = models.DecimalField( max_digits=15, decimal_places=2)
    
    def __str__(self) -> str:
        return f"{self.user} -- {self.amount}"
    
    

    
    
class MoneyTransaction(models.Model):
    sender = models.ForeignKey(User,related_name="sender", on_delete=models.DO_NOTHING)    
    receiver = models.ForeignKey(User,related_name="receiver", on_delete=models.DO_NOTHING)
    amount = models.DecimalField( max_digits=15, decimal_places=2)    
    date= models.DateTimeField( auto_now=False, auto_now_add=True)
    done= models.BooleanField(default =False)

    shift =models.ForeignKey("shift.ShiftDetail",related_name="transaction", on_delete=models.CASCADE,null=True)
    
    def __str__(self) -> str:
        return f"{self.sender} --> {self.receiver}-- {self.amount}"
    