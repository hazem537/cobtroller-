from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from shift.utilities import active_shift, end_shift, next_shift
from acces.models import MoneyTransaction
from django.contrib.auth.models import User
from shift.serializer import shiftdetail
from shift.utilities import active_shift


@permission_classes([IsAuthenticated])
@api_view(["POST"])
def post_end_shift(request):
    admin_user = User.objects.get(is_superuser=True)
    shift = active_shift(request)
    if shift:
        n_shift = next_shift(shift)
        done = end_shift(shift)
        if done:              
            # pass to admin
            new_trans = MoneyTransaction.objects.create (
                sender=request.user,
                receiver=admin_user,
                amount=shift.cash.amount + shift.cash.start,
                shift=shift
            )
            new_trans.save()
                
            shift_serializers= shiftdetail.ShiftDetailDataSerializer(instance=shift) 

            return Response({"shift": shift_serializers.data}, status=status.HTTP_200_OK)
        else:
            return Response(
                {"message": " next shift not exist "}, status=status.HTTP_404_NOT_FOUND
            )
    else:
        return Response(
            {"message": " cant get this shift "}, status=status.HTTP_404_NOT_FOUND
        )



@permission_classes([IsAuthenticated])
@api_view(["GET"])
def getShiftData(request):
    try:    
        shift = active_shift(request)
        serializer = shiftdetail.ShiftDetailDataSerializer(instance=shift)
        return  Response({"shift":serializer.data},status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({"message":str(e)},status=status.HTTP_400_BAD_REQUEST)



        

# @api_view(["GET"])
# def get_active_processes(request):
#         from shift.processing import ShiftProcessManager
#         from django.core.cache import cache
#         # process =cache.get("process")
#         # print(process)
#         # for pr in process :
#         #     print(pr)
#         pm =ShiftProcessManager()
#         print(pm.processes)
#         return Response({"message":"test"},status=status.HTTP_400_BAD_REQUEST)


@api_view(["GET"])
def getShiftdetailUser(request):
    try:    
        shift = active_shift(request)
        serializer = shiftdetail.ShiftDetailUsernameSerializer(instance=shift)
        return  Response(serializer.data,status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({"message":str(e)},status=status.HTTP_400_BAD_REQUEST)

