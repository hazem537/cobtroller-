from django.apps import AppConfig
from django.dispatch import Signal

card_ready = Signal()

# Signal handler or mechanism to set the flag/trigger when app2 is ready
def handle_card_ready(sender, **kwargs):
    # Set a flag or trigger to indicate that app2 is ready
    card_ready_flag = True
    



class CardConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'card'
    
    def ready(self):
        import card.signals.subscriptions 
        import card.signals.parking_session 
         
        card_ready.send(sender = self.__class__)       
        print("card_ready")