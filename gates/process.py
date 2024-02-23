from c3 import C3,controldevice
def get_real_time_log (gate_id,panel):
        import django 
        django.setup()
        from gates.models import Gate
        from shift.models import ShiftDetail
        from card.models import ParkingCard,ParkingSession 
        if panel.connect():
            gate = Gate.objects.get(pk=gate_id) 
            print(f"start listen on gate {gate.name} ")
       
            while True:
                # get gate that working on
                    gate = Gate.objects.get(pk=gate_id) 
                # check connection
                    if (panel._connected ==False):
                        panel.connect()
                        
                    # wawant to open in  gate
                    if gate.open_in == True:
                        print(f"want to open in door for gate{gate.name}")
                        open_in_door(panel)
                        gate.open_in=False
                        gate.save()
                  # want to open out  gate 
                    if gate.open_out ==True:
                        print(f"want to open out door for gate  {gate.name}")
                        open_out_door(panel)
                        gate.open_out=False
                        gate.save()
                        
                    try:
                        # check if any new some thing happen like some one in 
                        logs= panel.get_rt_log()
                        for log in logs :
                        # print(f" event type is {log.event_type}")
                            if log.event_type != 255    :
                                if log.card_no != 0 :
                                    # cleasr error of card number is zero may happen 
                                    print(f"{log.in_out_state}" )
                                   
                                    # and log.in_out_state == 0
                                    print(f" in out state is {log.in_out_state}")
                                    print(log.card_no)
                                    try:
                                        card ,creatd=ParkingCard.objects.get_or_create(num = log.card_no)
                                        card.save()
                                        
                                        # ceck category master
                                        # have master category open fgor him not saving it 
                                        from  card.models import  Category
                                        cat,_  =  Category.objects.get_or_create(name="master")
                                        cat.save()
                                        if (card.category.pk == cat.pk ):
                                            open_in_door(panel)
                                            continue
                                            # if it normal cart it open gate and make new session for him 
                                        new_session= ParkingSession.objects .create(card=card,gate_in=gate)                          
                                        # get shift in to attach for hime if we can
                                        try:
                                            from shift.utilities import active_shift_ip
                                            shift =active_shift_ip(gate.pc_ip)
                                            shift =ShiftDetail.objects.get(pk=shift.id) 
                                        except Exception as e:
                                            print(e)
                                        new_session.shift_in=shift
                                        new_session.save()    
                                        # we should capture image here
                                        
                                        # then open door 
                                        open_in_door(panel)
                                        
                                    except Exception as e:
                                        print(e)  
                    except OSError as os_err: 
                        # any disconnection error close it and start it again
                        panel.disconnect()
                        # gate.panel=None
                        print(f"os err  {os_err}")  
                                 
                    # except Exception as ex:
                    #       print(f"Exception is  {ex}")          

        else:
            print("no connection")          
                    

def open_in_door(panel):
    # send reuest to gate In to open 
        panel.control_device(controldevice.ControlDeviceOutput(1,1,1))
        # panel.control_device(controldevice.ControlDeviceOutput(1,1,0))

def open_out_door (panel):
        # send request open out to controller
        panel.control_device(controldevice.ControlDeviceOutput(2,1,1))
        # panel.control_device(controldevice.ControlDeviceOutput(2,1,0))
       
        
        
                           
                                   
                                   