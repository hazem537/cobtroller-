from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from shift.models import Shift
from django.utils import timezone
from shift.utilities import active_shift, end_shift, next_shift
from acces.models import MoneyTransaction
from django.contrib.auth.models import User


@permission_classes([IsAuthenticated])
@api_view(["POST"])
def post_end_shift(request):
    admin_user = User.objects.get(is_superuser=True)
    shift = active_shift(request)
    if shift:
        n_shift = next_shift(shift)
        # print(f"____{n_shift}")
        done = end_shift(shift)
        if done:
            data = request.data
            # print(data)
            if data["passto"]:
                if data["passto"] == "admin":
                    # pass to admin
                    new_trans = MoneyTransaction.objects.create(
                        sender=request.user,
                        receiver=admin_user,
                        amount=shift.cash.amount + shift.cash.start,
                        type=0,
                    )
                    new_trans.save()
                
                else:
                    # pass to next shift
                   
                    print(f"____{n_shift}")
                    new_trans = MoneyTransaction.objects.create(
                        sender=request.user,
                        receiver=n_shift.user,
                        amount=shift.cash.amount + shift.cash.start,
                        type=1,
                    )
                    new_trans.save()
                    

            return Response({"message": f" {shift} end "}, status=status.HTTP_200_OK)
        else:
            return Response(
                {"error": " next shift not exist "}, status=status.HTTP_404_NOT_FOUND
            )
    else:
        return Response(
            {"error": " cant get this shift "}, status=status.HTTP_404_NOT_FOUND
        )
