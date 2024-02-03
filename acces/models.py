from random import choices
from django.db import models
from django.db.models.signals import post_save, pre_delete
from django.dispatch import receiver
from django.contrib.auth.models import User
from django.db.models import Sum,Count
state =[
    (0,"in"),
    (1,"out"),
    (2,"no action"),
]

class Log (models.Model):
    id=models.PositiveIntegerField(db_column="id",primary_key=True)
    device =models.ForeignKey("Machines",related_name="monitor_log",on_delete=models.CASCADE)
    time =models.DateTimeField(db_column="time", auto_now=False, auto_now_add=False,null=True)
    card_no =models.PositiveIntegerField( db_column="card_no",null=True)
    state =models.CharField(max_length=50,db_column="state",choices=state,null=True)

    def __str__(self) -> str:
        return f"{self.card_no}  in {self.device} at {self.time} action { self.state}"
    
    class Meta:
        db_table = '[access].[dbo].[acc_monitor_log]'
        # exist =True
        managed=False
        ordering=["-time"]

    #add signal if satatus is in  
    #  add number of cars in place 
    # add counter for every machine  to know number of users inthis gate 
    # handel shift for every machine 
    # add auth for user cashier 
    # add car type and how calc values


class Place (models.Model):
    id=models.PositiveIntegerField(db_column="ID",primary_key=True)
    name =models.CharField( max_length=50 ,db_column="MachineAlias",null=True,blank=True)

    # machine = models.ForeignKey("acces.Machines",  on_delete=models.CASCADE)
    def __str__(self) -> str:
        return f"{self.name}"


    @property
    def number_in(self):
        total_in=Log.objects.filter(state=0).aggregate(total_amount=Count('id'))['total_amount']
        return total_in
    @property
    def number_out(self):
        total_out=Log.objects.filter(state=1).aggregate(total_amount=Count('id'))['total_amount']
        return total_out   
    
    @property
    def number_of_car(self):
        total_in = Log.objects.filter(state=0).aggregate(total_amount=Count('id'))['total_amount']
        total_out = Log.objects.filter(state=1).aggregate(total_amount=Count('id'))['total_amount']
        return total_in-total_out
        
    class Meta:
        db_table = '[access].[hazem].[Places]'
        
        
        # managed=False    
    
     
class Machines (models.Model):
    id=models.PositiveIntegerField(db_column="ID",primary_key=True)
    name =models.CharField( max_length=50 ,db_column="MachineAlias",null=True,blank=True)
    ip =models.CharField( max_length=50 ,db_column="IP",null=True,blank=True)
    
    # user= models.OneToOneField(User , related_name="machine", on_delete=models.DO_NOTHING,null=True,blank=True,db_column="User_id")
    Place =models.ForeignKey( Place , related_name="machine", on_delete=models.DO_NOTHING ,db_column="Place_id",null=True)
    cam_ip = models.CharField( max_length=50,null=True)
    def __str__(self) -> str:
        return f"{self.name}"



    @property
    def number_in(self):
        total_in=Log.objects.filter(state=0,device=self).aggregate(total_amount=Count('id'))['total_amount']
        return total_in
    @property
    def number_out(self):
        total_out=Log.objects.filter(state=1,device=self).aggregate(total_amount=Count('id'))['total_amount']
        return total_out   
    
    @property
    def number_of_car(self):
        total_in = Log.objects.filter(state=0,device=self).aggregate(total_amount=Count('id'))['total_amount']
        total_out = Log.objects.filter(state=1,device=self).aggregate(total_amount=Count('id'))['total_amount']
        return total_in-total_out
        
    class Meta:
        db_table = '[access].[dbo].[Machines]'
        # managed=False
    
# \\\\\\\\\\\\\\\\\\\\\\\\\\

class Money (models.Model):
    user =  models.OneToOneField(User,related_name= "money", on_delete=models.CASCADE)
    amount = models.DecimalField( max_digits=15, decimal_places=2)
    
    def __str__(self) -> str:
        return f"{self.user} -- {self.amount}"
    
    
tran_types =[
    (0,"to-admin"),
    (1,"to-next-shift"),
]
    
    
class MoneyTransaction(models.Model):
    sender = models.ForeignKey(User,related_name="sender", on_delete=models.DO_NOTHING)    
    receiver = models.ForeignKey(User,related_name="receiver", on_delete=models.DO_NOTHING)
    amount = models.DecimalField( max_digits=15, decimal_places=2)    
    date= models.DateTimeField( auto_now=False, auto_now_add=True)
    done= models.BooleanField(default =False)
    type=models.CharField( max_length=50,choices=tran_types)
    
    
    def __str__(self) -> str:
        return f"{self.sender} --> {self.receiver}-- {self.amount}"
    