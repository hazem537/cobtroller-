import re
from tracemalloc import start
from shift.models import Shift, ShiftDetail
from django.utils import timezone
from acces.models import Machines


def get_client_ip(request):
    x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
    if x_forwarded_for:
        ip = x_forwarded_for.split(",")[0]
    else:
        ip = request.META.get("REMOTE_ADDR")
    return ip


def machine_with_ip(ip):
    try:

        actual_machine = Machines.objects.get(ip=ip)
        return actual_machine
    except Exception as e:
        print(e)
        return None

# get active shift by time
def active_shift(request):
    detail_shifts = ShiftDetail.objects.filter(
        mainShift__start__lte=timezone.now(), mainShift__end__gte=timezone.now()
    )
    machine = machine_with_ip(get_client_ip(request))
    if not machine:
        return None
    # print(machine)
    shift = detail_shifts.filter(machine=machine).first()
    
    if shift :
        
        if shift.started == False and shift.ended == False:
            return prev_shift(shift)
            # gret pervious
            
        elif shift.started == True and shift.ended == False:
            # this is active shift
            return shift
        
        elif shift.started == True and shift.ended == True:
            #  get next shift 
            return next_shift(shift)
    else:
        return None  
    


# get next shift by another shift
def next_shift(shift: ShiftDetail):
    try:
        n_shift = ShiftDetail.objects.filter(
            mainShift__start__exact=shift.mainShift.end, machine=shift.machine
        ).first()
        print(n_shift)
    except Exception as e:
        print(e)
        return None
        
    if(n_shift.ended == True):
        return next_shift(n_shift)
    else:
        return n_shift    

def prev_shift(shift:ShiftDetail):
    try:
        p_shift  =ShiftDetail.objects.filter(
            maniShift__end__exact=shift.mainShift.start,machine=shift.machine
        ).first()
    except Exception as e:
        print(e)    
        return None
    
    if p_shift.started == False:
        return prev_shift(p_shift)
    else:
        return p_shift    
    
    


# end shift
def end_shift(shift: ShiftDetail):
    try:
        shift.ended = True
        shift.save()
        n_shift  =next_shift(shift)
        n_shift.started =True
        n_shift.save()
    except Exception as e:
        print(e)
        return None
    return True


# need user to pass shift to (not admih ,not him self ,not user with himin same shift)
def pass_shift():
    pass


