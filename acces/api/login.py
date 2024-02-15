from rest_framework.response import Response
from acces.serializers import CustomLoginSerializer
from acces.utilities import get_client_ip
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from shift.models import ShiftDetail
from shift.serializer.shift import ShiftSerializer
from shift.serializer.shiftdetail import ShiftDetailRetrive
from shift.serializer.user import UserSerializer
from shift.utilities import active_shift
from rest_framework_simplejwt.tokens import RefreshToken


@api_view(["POST"])
def login(request):
    serializer = CustomLoginSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    username = serializer.validated_data["username"]
    password = serializer.validated_data["password"]
    try:
        user = User.objects.get(username=username)
    except Exception as e:
        return Response(
            {"error": "هذا المستخدم غير موجود"}, status=status.HTTP_404_NOT_FOUND
        )
    valid_password = user.check_password(password)
    if not valid_password:
        return Response(
            {"error": " الباسورد غير صحيح"}, status=status.HTTP_401_UNAUTHORIZED
        )
    
    # get shift in

    # print(shift)

    # #  get shift detail associate with this user
    user_serializer = UserSerializer(instance=user)
    # print(user.shift.filter(shift__date=timezone.now()))

    if not user.is_superuser:
        
        try:
            shift:ShiftDetail = active_shift(request)
        except Exception as e:
                return Response(
                {"error": str(e)},
                status=status.HTTP_400_BAD_REQUEST,
            )
        print(shift)
        # if shift.machine.ip != client_ip:
        #     return Response(
        #         {"error": "this is not yoyr machien "},
        #         status=status.HTTP_400_BAD_REQUEST,
        #     )
        print(shift.user.all())
        if not  shift.user.filter(pk=user.pk).exists() :
            return Response(
                {"error": f"your are not in this gate  this gate is {shift.machine.name} "},
                status=status.HTTP_404_NOT_FOUND,
            )


        # machine_serializer = MachinesSerializers(instance=machine)

        shift_serializer = ShiftSerializer(instance=shift.mainShift)
        shift_detail_serializer = ShiftDetailRetrive(instance=shift)

    refresh = RefreshToken.for_user(user)
    access_token = str(refresh.access_token)
    if not user.is_superuser:
        return Response(
            {
                "token": access_token,
                "user": user_serializer.data,
                "shift": shift_serializer.data,
                "detail": shift_detail_serializer.data,
            },
            status=status.HTTP_200_OK,
        )
    else:
        return Response(
            {"token": access_token, "user": user_serializer.data},
            status=status.HTTP_200_OK,
        )

   