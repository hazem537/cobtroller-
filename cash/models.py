from django.db import models
from django.forms import CharField
# from shift.models import ShiftDetail 
# # Create your models here.

from django.contrib.auth.models import User



class Cash (models.Model):
    shift = models.OneToOneField("shift.ShiftDetail", related_name = "cash", on_delete=models.CASCADE)
    start =models.DecimalField( max_digits=15, decimal_places=2,default=0)
    amount =models.DecimalField( max_digits=15, decimal_places=2,default=0)
    
    def __str__(self) -> str:
        return f"{self.shift}has {self.amount} "
# class CashDetail(models.Model):
#     card_no = models.CharField( max_length=50,null=True)
#     machine_in= models.ForeignKey(Gate,related_name="car_in", on_delete=models.CASCADE,null=True)
#     machine_out= models.ForeignKey(Gate,related_name="car_out", on_delete=models.CASCADE,null=True)
#     time_in  =models.DateTimeField( auto_now=False, auto_now_add=False,null=True)
#     time_out  =models.DateTimeField( auto_now=False, auto_now_add=False)
#     product = models.CharField (max_length=50)
#     product_cost  = models.PositiveIntegerField(default=0)
#     cash = models.ForeignKey(Cash, related_name="detail", on_delete=models.CASCADE)
#     total  =models.DecimalField( max_digits=7, decimal_places=2)
#     duration  = models.PositiveIntegerField()
#     offer  = models.DecimalField(max_digits=7, decimal_places=2,default=0)
#     card_lost =models.BooleanField(default=False)
#     cashier =models.ForeignKey(User,related_name="cash_detail",  on_delete=models.CASCADE )
#     image = models.ImageField( upload_to="image",null=True, height_field=None, width_field=None, max_length=None)
#     def __str__(self) -> str:
#         return f"{self.card_no}     total:{self.total}" 