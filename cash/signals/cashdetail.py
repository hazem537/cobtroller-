from django.dispatch import receiver
from django.db.models.signals import post_save,post_delete

from cash.models import Cash ,CashDetail 
from django.db.models import Sum,DecimalField
import  cv2
from django.core.files.base import ContentFile

@receiver(post_save, sender=CashDetail)
def after_create_detail_add_cash(sender,instance:CashDetail,created,  **kwargs):
        if(created ):
                if instance.card_lost ==False:
                        cap = cv2.VideoCapture(f"rtsp://{instance.machine_out.cam_ip}:554/user=admin_password=_channel=1_stream=0.sdp")
                        ret, frame = cap.read()
                        if ret :
                                temp_file =ContentFile(cv2.imencode('.jpg', frame)[1].tobytes())
                                instance.image.save('captured_image.jpg', temp_file, save=True)
                                instance.save()
                                cap.release()
                                
                                
        main_cash = instance.cash
        # print("---------")
        # print(main_cash)
       
        total_amount = main_cash.detail.aggregate(total_amount=Sum('total',output_field=DecimalField()))['total_amount']
        offer_amount = main_cash.detail.aggregate(offer_amount=Sum('offer',output_field=DecimalField()))['offer_amount']
        sum_amount =total_amount-offer_amount
        # print(sum_amount)
        
        main_cash.amount =sum_amount
        main_cash.save()
       


@receiver(post_delete, sender=CashDetail)
def after_delete_detail_add_cash(sender,instance:CashDetail,  **kwargs):
        main_cash = instance.cash
        # print("---------")
        # print(main_cash)
        total_amount = main_cash.detail.aggregate(total_amount=Sum('total',output_field=DecimalField()))['total_amount']
        offer_amount = main_cash.detail.aggregate(offer_amount=Sum('offer',output_field=DecimalField()))['offer_amount']

        if total_amount and  offer_amount:
                sum_amount =total_amount-offer_amount
                print(sum_amount)
        
                main_cash.amount =sum_amount
                main_cash.save()
    