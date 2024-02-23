
from django.core.management.base import BaseCommand
# from shift.processing import Controller
# from gates.models import 
import django
import multiprocessing
from gates.process import get_real_time_log



class Command(BaseCommand):
    help = 'Prints "Hello, world!" to the console.'

    def handle(self, *args, **options):
        import django
        django.setup()
        from sys import argv
        if 'makemigrations' in argv or 'migrate' in argv:
            return
        
        from gates.models import Gate
        gates =Gate.objects.all()
        for gate in gates:
            panel =gate.start()
            process= multiprocessing.Process(target=get_real_time_log ,args=(gate.pk,panel) )
            process.start () 

