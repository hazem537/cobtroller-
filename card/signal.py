from django.dispatch import Signal

card_ready = Signal()

# Signal handler or mechanism to set the flag/trigger when app2 is ready
def handle_card_ready(sender, **kwargs):
    # Set a flag or trigger to indicate that app2 is ready
    card_ready_flag = True
