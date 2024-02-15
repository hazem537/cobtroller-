from django.apps import AppConfig
from django.dispatch import receiver
from django.db.models.signals import post_migrate
from card.apps import card_ready

    
class ShiftConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'shift'
    def ready(self):
        print("shift ready")
        return
               
# @receiver(card_ready)
# def  handel_app_ready(sender,**kwargs):
   
    

# @receiver(post_migrate)
# def handle_post_migrate(sender, **kwargs):    
#         from sys import argv
#         if 'makemigrations' in argv or 'migrate' in argv:
#             return
#         from gates.models import Gate
#         from shift.processing import PM
#         from shift.utilities import active_shift_ip
#         for gate in Gate.objects.all():
#             shift =active_shift_ip(gate.pc_ip)
#             if PM.get_shift_process(shift.id) is None:
#                 PM.add_shift_process(shift.id,shift.machine.ip,shift.machine.id)
#             PM.start_shift_process(shift.id)

    # This function is called after migrations have been applied
    # Perform initialization tasks here
    # For example, you can start background processes or load initial data
  
                