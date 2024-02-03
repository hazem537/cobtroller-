from django.contrib import admin
from acces.models import Log, Machines, Place, Money ,MoneyTransaction

admin.site.register(Log)
admin.site.register(Machines)
admin.site.register(Place)
admin.site.register(Money)
admin.site.register(MoneyTransaction)

