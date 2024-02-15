from c3 import C3,controldevice


class Gate :
    def __init__(self,ip) :
        self.panel = C3(ip)
        self.test = self.panel.connect()

    def test_machine (self):
        return self.panel.connect()

    def connect(self):
        if  not self.test:
            self.test= self.panel.connect()
        return self.test
    
    def disconnect(self):
        self.panel.disconnect()
        
            
    def get_rtlog(self):
        pass
    
    def open_in(self):
        pass
    
    def open_out(self):
        pass
    
    def close_in(self):
        pass
    
    def close_out(self):
        pass