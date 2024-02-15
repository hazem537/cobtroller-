from django.db.models import Count ,Case, When, IntegerField,Q,F
from operator import pos
from django.db import models
from django.utils import timezone
from datetime import timedelta
from gates.models import Gate
from django.contrib.auth.models import User

from django.db.models.signals import post_save, pre_delete, pre_save, m2m_changed
from django.dispatch import receiver
from django.db.models import UniqueConstraint
from django.db.models import Sum
# Create your models here.

types = [("صباحي", "صباحي"), ("مسائي", "مسائي")]


class Shift(models.Model):
    start = models.DateTimeField(
        auto_now=False, auto_now_add=False, null=True, blank=True
    )
    end = models.DateTimeField(
        auto_now=False, auto_now_add=False, null=True, blank=True
    )
    date = models.DateField(
        auto_now=False, auto_now_add=False, blank=True, default=timezone.now
    )
    type = models.CharField(max_length=50, choices=types, default=types[0])


    def __str__(self) -> str:
        return f"{self.date} {self.type}"

    class Meta:
        unique_together = ("date", "type")
    
    
    def car_in(self):
        # return self.detail.all().exclude(session_in__lost_card=True).annotate(car_in=Count("session_out__id")).aggregate(Sum("car_in"))['car_in__sum'] 
       return self. detail.all().annotate(count=Count('session_in__id',filter=Q(session_in__lost_card=False))).aggregate(sum=Sum('count'))['sum']  
     
    def car_in_detail(self):
         return self.detail.all().values(category=F ('session_in__category')).annotate(count=Count("session_in__id",filter=Q(session_in__lost_card=False)))  
            

    def car_out(self):
        return self.detail.all().annotate(car_out=Count("session_out__id")).aggregate(Sum("car_out"))['car_out__sum']  


    def car_out_detail(self):
       return self.detail.all().values(category =F('session_out__category')).annotate(count=Count("session_out__id"))           
       
    def all_cash(self):
        return self.detail.aggregate(total=Sum("cash__amount"))["total"]
    

    def save(self, *args, **kwargs):
        if self.type == "صباحي":
            self.start = timezone.make_aware(
                timezone.datetime.combine(self.date, timezone.datetime.min.time())
                + timedelta(hours=8)
            )
            self.end = timezone.make_aware(
                timezone.datetime.combine(self.date, timezone.datetime.min.time())
                + timedelta(hours=20)
            )
        else:
            self.start = timezone.make_aware(
                timezone.datetime.combine(self.date, timezone.datetime.min.time())
                + timedelta(hours=20)
            )
            self.end = timezone.make_aware(
                timezone.datetime.combine(
                    self.date + timedelta(days=1), timezone.datetime.min.time()
                )
                + timedelta(hours=8)
            )

        return super().save(*args, **kwargs)


@receiver(post_save, sender=Shift)
def create_shift_detail(sender, instance, created, **kwargs):
    gates = Gate.objects.all()
    for machine in gates:
        shift_detail = ShiftDetail.objects.create(mainShift=instance, machine=machine)
        shift_detail.save()


class ShiftDetail(models.Model):
    mainShift = models.ForeignKey(
        "Shift", related_name="detail", on_delete=models.CASCADE
    )
    user = models.ManyToManyField(
        User, related_name="shift_detail", blank=True
    )
    machine = models.ForeignKey(
        Gate, related_name="shift_detail", on_delete=models.CASCADE
    )
    ended = models.BooleanField(null=True, default=False)
    started = models.BooleanField(null=True, default=False)

    class Meta:
        UniqueConstraint(fields=["mainShift", "users"], name="unique_user_per_shift")

    def __str__(self):
        return f" {self.machine} {self.ended}"
    
    
    def car_in (self):
        return   self.session_in.exclude(lost_card=True).count()
    
    def car_out (self):
        return   self.session_out.count()
        
    def car_in_detail(self):
      
        return self.session_in.exclude(lost_card=True).values('category').annotate(count=Count('id'))
    
    def car_out_detail(self):
        return self.session_out.values('category').annotate(count=Count('id'))
    
    
    
    def get_shift_data (self):
        in_car  =self.session_in.count()
        in_car_detail =self.session_in.values('category').annotate(count=Count('id'))
        out_car  =self.session_out.count()
        out_car_detail =self.session_out.values('category').annotate(count=Count('id'))

        
    # def save(self,*args, **kwargs):
    #     # other detail in same shift
    #     other_detail = ShiftDetail.objects.filter(mainShift=self.mainShift)
    #     for s_detail in other_detail:
    #         print(self.user)
    #         print(s_detail)
    #         # for new_user in  self.user.filter():
    #         #     if s_detail.user.filter(pk= new_user.pk).exists():
    #         #         raise ValueError ("This User is alrady exist ")
    #         #     else:
    #         #       pass

    #     super().save(*args, **kwargs)


def users_schanged_in_detail(sender, instance, **kwargs):
    if instance.pk is None:
        pass
        # print(instance)
        # print("Hello in Create new ")
    other_detail = ShiftDetail.objects.filter(mainShift=instance.mainShift).exclude(
        pk=instance.pk
    )
    # print(other_detail)
    # print(instance.user.all())
    for new_user in instance.user.all():
        for s_detail in other_detail:
            if s_detail.user.filter(pk=new_user.pk).exists():
                raise ValueError("This User is alrady exist ")
            else:
                pass
    # print("Hello in update")


m2m_changed.connect(users_schanged_in_detail, sender=ShiftDetail.user.through)



from django.dispatch import receiver
from shift.models import ShiftDetail
from django.db.models.signals import post_save
from cash.models import Cash 
from shift .utilities import prev_shift

@receiver(post_save, sender=ShiftDetail)
def after_create_detail_add_cash(sender,instance,created,  **kwargs):
    if created:
        new_cash = Cash.objects.create(shift=instance,amount=0)
        new_cash.save()
        p_shift  = prev_shift(instance)
        if(not  p_shift):
            instance.started =True
            instance.save()
        else:
            if(p_shift.ended ==True):
                instance.started=True
                instance.save()
        return new_cash  


@receiver(post_save,sender=ShiftDetail)
def startprocess(sender,instance:ShiftDetail,created,**kwargs):
    if created:
        pass
    else:
        from shift.processing import PM
        if instance.started== True and instance.ended == False:
            shift_process =PM.get_shift_process(instance.pk) 
            if shift_process is None:    
               PM.add_shift_process(instance.pk,instance.machine.ip,instance.machine.id) 
            PM.start_shift_process(instance.pk)  
            
            #  add process for each detail
        if instance.ended==True:
            shift_process=PM.get_shift_process(instance.pk)
            if shift_process is not None:
                print("Process end ")
                PM.close_shift_process(instance.pk)
        
    
    

