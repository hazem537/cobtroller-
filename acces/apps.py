from django.apps import AppConfig
from c3 import C3

class AccesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'acces'

    def ready(self):
        import acces.signals.money
        import acces.signals.moneyTransaction
        # from acces.models import Machines  
        # all_machines = Machines.objects.all()
        # for x in all_machines:
        #     ip=x.ip
        #     panel =C3(ip)
        #     print(panel.connect())
            
            