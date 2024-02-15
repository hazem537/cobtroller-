
import multiprocessing    
from c3 import C3,controldevice
                  

def controoler_listner (ip:str,shift_id ,gate_id ):
            
            import django 
            django.setup()
            panel = C3 (ip)
            if panel.connect():

                    from  card.models import ParkingCard,ParkingSession
                    from gates.models import Gate
                    from shift.models import ShiftDetail
                    print("connected")
                    while True:
                        try:
                            log = panel.get_rt_log()[0]
                            if log.event_type != 255 and log.in_out_state == 0 :
                                print(log.card_no)
                                card ,creatd=ParkingCard.objects.get_or_create(num = log.card_no)
                                card.save()
                                gate = Gate.objects.get(pk=gate_id) 
                                shift =ShiftDetail.objects.get(pk=shift_id) 
                                new_session= ParkingSession.objects .create(card=card,gate_in=gate)                          
                                new_session.shift_in=shift
                                
                                new_session.save()
                                # open door 
                                print("before open")
                                open_in_door()
                                
                                print("before open")
                                
                                
                                print(new_session)
                        except Exception as e:
                            print(type(e))
                            print(e)
            else:
                print("control not avilabel")
        

def open_in_door(panel):
    panel.control_device(controldevice.ControlDeviceOutput(1,1,1))            
    pass

def open_out_door(door_ip):
    panel=C3(door_ip)
    if panel.connect()  : 
        panel.control_device(controldevice.ControlDeviceOutput(2,1,1))            
        panel.disconnect()


class ShiftProcess:
    def __init__(self, shift_id,gate_ip,gate_id):
        self.shift_id = shift_id
        self.gate_ip=gate_ip
        self.gate_id = gate_id
        self.process = None
        
    def start(self):
        
        self.process = multiprocessing.Process(target=controoler_listner,args=(self.gate_ip,self.shift_id,self.gate_id))
        self.process.start()

    def close(self):
        if self.process:
            self.process.terminate()

    
class ShiftProcessManager:
    def __init__(self):
        
        self.processes = []

    def start_shift_process(self, shift_id):
        
        if  self.get_shift_process(shift_id) is not None:
            shift_process = self.get_shift_process(shift_id)
            shift_process.start()
            self.processes.append(shift_process)
            return True  # Indicate that the process was started
        return False  # Indicate that the process was not started because it already exists

    def close_shift_process(self, shift_id):
        shift_process = self.get_shift_process(shift_id)
        if shift_process:
            shift_process.close()
            self.processes.remove(shift_process)
            return True  # Indicate that the process was closed
        return False  # Indicate that the process was not found and therefore not closed

    def get_shift_process(self, shift_id):
        for shift_process in self.processes:

            if shift_process.shift_id == shift_id:
                return shift_process
        return None  # Indicate that the process was not found

    def add_shift_process(self, shift_id,gate_ip,gate_id):
        if not self.get_shift_process(shift_id):
            shift_process = ShiftProcess(shift_id,gate_ip,gate_id)
            self.processes.append(shift_process)
            return True  # Indicate that the process was added
        return False  # Indicate that the process was not added because it already exists

    def terminate_all_processes(self):
        for shift_process in self.processes:
            shift_process.close()
        self.processes = []  
        
PM =ShiftProcessManager() 