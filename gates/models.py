
from django.db import models
from django.conf import settings
from django.db.models import Count
from c3 import C3 ,controldevice

import multiprocessing

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
    pc_ip = models.CharField(max_length=50,unique=True,null= True)
    cam_in_ip = models.CharField(max_length=50,unique=True)
    cam_out_ip = models.CharField(max_length=50,unique=True)
    place = models.ForeignKey(Place, related_name="machines", on_delete=models.CASCADE ,null=True,blank=True)
    open_in =models.BooleanField(default=False)
    open_out =models.BooleanField(default=False)
    

    
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


    def start (self):
        import django 
        django.setup()
        if hasattr(self,"panel"):
            return self.panel 
        self.panel = C3(self.ip)
        self.panel.receive_timeout=None
        return self.panel
    
    def connect(self): 
        if self.panel._connected ==False:
           return self.panel.connect()
        return True 
    
    def test(self):
        import django 
        django.setup()
        if self.panel._connected ==True :
            return True
        else:
            return self.panel.connect()
    
    def disconnect (self):
        self.panel.disconnect()                  
       
  
    def get_real_time_log (self,gate_id,shift_id):
        import django 
        django.setup()
        from gates.models import Gate
        from shift.models import ShiftDetail
        from card.models import ParkingCard,ParkingSession 
        if self.panel.connect():
            print("start")
            gate = Gate.objects.get(pk=gate_id) 
            shift =ShiftDetail.objects.get(pk=shift_id) 
            while True:
                
                    if (self.panel._connected ==False):
                        self.panel.connect()
                    try:
                        logs= self.panel.get_rt_log()
                        for log in logs :
                        # print(f" event type is {log.event_type}")
                            if log.event_type != 255  and log.in_out_state == 15 :
                                # and log.in_out_state == 0
                                print(f" in out state is {log.in_out_state}")
                                print(log.card_no)
                                try:
                                    card ,creatd=ParkingCard.objects.get_or_create(num = log.card_no)
                                    card.save()
                                    gate = Gate.objects.get(pk=gate_id) 
                                    shift =ShiftDetail.objects.get(pk=shift_id) 
                                    new_session= ParkingSession.objects .create(card=card,gate_in=gate)                          
                                    new_session.shift_in=shift
                                    new_session.save()
                                    self.open_in_door()
                                    
                                except Exception as e:
                                    print(e)  
                    except OSError as os_err: 
                        
                        self.panel.disconnect()
                        print(f"os err  {os_err}")  
                                 
                    # except Exception as ex:
                    #       print(f"Exception is  {ex}")          

        else:
            print("no connection")          
                                   
    def listen_to_gate(self,shift_id):
            import django 
            django.setup()
            process= multiprocessing.Process(target=self.get_real_time_log ,args=(self.pk,shift_id) )
            process.start ()
