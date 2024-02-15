from django.db import models
from django.conf import settings
from django.db.models import Count
# Create your models here.
# from card.models import ParkingSession

class Place(models.Model):
    name = models.CharField(max_length=50)


    def __str__(self) -> str:
        return self.name

    def car_number(self):
        return self.machines.filter(parking_in__done=False).aggregate(car_out=Count("id"))['car_out']
    
class Gate(models.Model):
    name = models.CharField(max_length=50,unique=True)
    ip = models.CharField(max_length=50,unique=True)
    pc_ip = models.CharField(max_length=50,unique=True)
    cam_in_ip = models.CharField(max_length=50,unique=True)
    cam_out_ip = models.CharField(max_length=50,unique=True)
    place = models.ForeignKey(Place, related_name="machines", on_delete=models.CASCADE ,null=True,blank=True)


    
    def save(self,*args, **kwargs):
        if self.place is None:
            place_name = getattr(settings,'PLACE_NAME')
            # print(settings.PLACE_NAME)
            obj,created = Place.objects.get_or_create(name=place_name)
            if created :
                obj.save()
            self.place =obj    
        super().save(*args, **kwargs)

    def __str__(self) -> str:
        return f"{self.name}   {self.ip}  {self.place}"
