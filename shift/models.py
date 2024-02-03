
from django.db import models
from django.utils import timezone
from datetime import timedelta
from acces.models import Machines
from django.contrib.auth.models import User
 
from django.db.models.signals import post_save, pre_delete
from django.dispatch import receiver
# Create your models here.
types =[
    ("صباحي","صباحي"),
    ("مسائي","مسائي")
]

class Shift (models.Model):
    start =models.DateTimeField( auto_now=False, auto_now_add=False,null=True,blank=True)
    end = models.DateTimeField( auto_now=False, auto_now_add=False,null=True,blank=True)
    date =models.DateField( auto_now=False, auto_now_add=False,blank=True,default=timezone.now)
    type =models.CharField(max_length=50,choices=types ,default =types[0] )
    
    def __str__(self) -> str:
         return  f"{self.date} {self.type}"
    class Meta:
        unique_together=("date","type") 
     
    def save(self,*args, **kwargs):
        if self.type == "صباحي":
            self.start = timezone.make_aware(timezone.datetime.combine(self.date, timezone.datetime.min.time()) + timedelta(hours=8))
            self.end = timezone.make_aware(timezone.datetime.combine(self.date, timezone.datetime.min.time()) + timedelta(hours=20))        
        else:    
            self.start = timezone.make_aware(timezone.datetime.combine(self.date, timezone.datetime.min.time()) + timedelta(hours=20))
            self.end = timezone.make_aware(timezone.datetime.combine(self.date + timedelta(days=1), timezone.datetime.min.time()) + timedelta(hours=8))

        return super().save(*args, **kwargs)
@receiver(post_save,sender=Shift)            
def create_shift_detail(sender, instance, created, **kwargs):
        machines =Machines.objects.all()
        for machine in machines:
            shift_detail = ShiftDetail.objects.create(mainShift=instance,machine=machine)
            shift_detail.save()
        
            
class ShiftDetail (models.Model):
    mainShift =models.ForeignKey("Shift",related_name="detail" , on_delete=models.CASCADE)
    user=models.ForeignKey(User,related_name="shift_detail" ,on_delete=models.DO_NOTHING,blank=True,null=True)
    machine=models.ForeignKey(Machines,related_name="shift_detail", on_delete=models.DO_NOTHING )
    ended=models.BooleanField(null= True,default=False)
    started=models.BooleanField(null= True,default=False)
    class Meta:
        unique_together = ("mainShift","user")
        
    def __str__(self):
        return f"{self.mainShift} {self.user} {self.machine} {self.ended}"    
    
# class Shift (models.Model):
#     ShiftType= models.OneToOneField("ShiftAsset", on_delete=models.DO_NOTHING)
#     # Date = models.DateField( auto_now=False, auto_now_add=False)
#     startDate=models.DateTimeField( auto_now=False, auto_now_add=False)
#     endDate =models.DateTimeField( auto_now=False, auto_now_add=False)
#     @property
#     def total(self):
#         details = self.details.all()
#         amount=0
#         for x in details:
#             amount += x.cash
        
#         return  amount
#     def __str__(self) -> str:
#         return  f"{self.ShiftType.Name} {self.Date}  {self.total}"

# class ShiftDetail(models.Model):
#     shift = models.ForeignKey("Shift", related_name="details", on_delete=models.CASCADE) 
#     User = models.ForeignKey("User",related_name="shift",on_delete=models.DO_NOTHING,null=True)
#     Machine =models.ForeignKey("Machines",  on_delete=models.DO_NOTHING,null=True)
#     cash =models.PositiveIntegerField(null=True,default=0)

#     class Meta:
#         unique_together = ('shift', 'User')
    
#     # def save(self, *args, **kwargs):
#     #     # Check if the user is already assigned to a shift detail within the same main shift
#     #     if ShiftDetail.objects.filter(shift=self.shift, user=self.user).exclude(pk=self.pk).exists():
#     #         raise ValueError("هذا المستخدم موجود بالفعل بهذه الشيفت")
        
#     #     super().save(*args, **kwargs)    
        
# class ShiftAsset(models.Model):
#     Name = models.CharField( max_length=50) 
#     # StartAt = models.TimeField( auto_now=False, auto_now_add=False)
#     # EndAt =models.TimeField( auto_now=False, auto_now_add=False)
#     def __str__(self) -> str:
#         return f"{self.Name}= from {self.StartAt} to {self.EndAt} "