from django.apps import AppConfig


class AccesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'acces'

    def ready(self):
        import acces.signals.money
        import acces.signals.moneyTransaction
        