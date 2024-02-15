from django.core.management.base import BaseCommand

class Command(BaseCommand):
    help = 'Prints "Hello, world!" to the console.'

    def handle(self, *args, **options):
        # self.stdout.write(self.style.SUCCESS('Hello, world!'))
        from shift.processing import PM
        print("strat listning in shift ")
        from sys import argv
        if 'makemigrations' in argv or 'migrate' in argv:
            return
        from gates.models import Gate
        from shift.utilities import active_shift_ip
        for gate in Gate.objects.all():
            shift =active_shift_ip(gate.pc_ip)
            print(shift.pk)
            if PM.get_shift_process(shift.id) is None:
                PM.add_shift_process(shift.id,shift.machine.ip,shift.machine.id)
            PM.start_shift_process(shift.id)     
 