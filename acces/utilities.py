from acces.models import Log



def get_last_in_log (card_no):

    last_in_log = Log.objects.filter(card_no =card_no).filter(state=0).latest("time")
    return last_in_log

def get_client_ip(request):
    # print(request.META.get('HTTP_X_FORWARDED_FOR'))
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip
