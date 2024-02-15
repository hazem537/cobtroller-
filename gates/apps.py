
from multiprocessing import Process
from django.apps import AppConfig
# from gates.processing import controoler_listner
from django.db.models.signals import post_migrate
from django.dispatch import receiver

class GatesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'gates'



    # @receiver(post_migrate)
    def ready(self):
            # process = Process(target=controoler_listner, args=("192.168.1.252",4))
            # process.start(()
        pass    
    
    
