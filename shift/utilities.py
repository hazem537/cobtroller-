   
import re
from tracemalloc import start
from shift.models import Shift, ShiftDetail
from django.utils import timezone
from gates.models import Gate


def get_client_ip(request):
    x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
    if x_forwarded_for:
        ip = x_forwarded_for.split(",")[0]
    else:
        ip = request.META.get("REMOTE_ADDR")        
    return ip


def machine_with_ip(ip):
    try:
        print(ip)
        actual_machine = Gate.objects.get(pc_ip=ip)
        return actual_machine
    except Exception as e:
        for gate in Gate.objects.all():
            print(gate.pc_ip)
        print(e)
        raise Exception("this device not in the shift")
    
    
def  get_active_mainshift ():
    selected_shift = Shift.objects.filter(start__lte=timezone.now(),end__gte=timezone.now())
    if(selected_shift.exists()):
            return selected_shift.first()
    else:
        raise  Exception("call admin create new Shift ")
# get active shift by time

def active_shift_ip(ip):
    
    detail_shifts = get_active_mainshift().detail
    machine =machine_with_ip(ip)
    shift = detail_shifts.get(machine=machine)
    if shift :
        # print(shift)
        if shift.started == False and shift.ended == False:
            p_shift =prev_shift(shift)
            if  p_shift is None:
                shift.started=True
                shift.save()
                return shift
            else:
                return p_shift
            # gret pervious
            
        elif shift.started == True and shift.ended == False:
            # this is active shift
            return shift
        
        elif shift.started == True and shift.ended == True:
            #  get next shift 
            n_shift = next_shift(shift) 
            if n_shift is None:
                shift.ended= False
                shift.save()
                return shift 
            else: 
                return n_shift

    else:
        return None  
    
        

def active_shift(request):

    detail_shifts = get_active_mainshift().detail

    machine = machine_with_ip(get_client_ip(request))
   
    shift = detail_shifts.get(machine=machine)

    
    if shift :
        print(shift)
        if shift.started == False and shift.ended == False:
            p_shift =prev_shift(shift)
            if  p_shift is None:
                shift.started=True
                shift.save()
                return shift
            else:
                return p_shift
            # gret pervious
            
        elif shift.started == True and shift.ended == False:
            # this is active shift
            return shift
        
        elif shift.started == True and shift.ended == True:
            #  get next shift 
            n_shift = next_shift(shift) 
            if n_shift is None:
                shift.ended= False
                shift.save()
                return shift 
            else: 
                return n_shift

    else:
        return None  
    


# get next shift by another shift
def next_shift(shift: ShiftDetail):
    try:
        n_shift = ShiftDetail.objects.filter(
            mainShift__start__exact=shift.mainShift.end, machine=shift.machine
        ).first()
       
    except Exception as e:
        print(e)
        return None
        
    if(n_shift.ended == True ):
        return next_shift(n_shift)
    else:
        return n_shift    

def prev_shift(shift:ShiftDetail):
    try:
        p_shift  =ShiftDetail.objects.get(
            mainShift__end__exact=shift.mainShift.start,machine=shift.machine
        )
    except Exception as e:
        print(e)    
        return None
  
    if p_shift.started  and p_shift.started  == False:
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


