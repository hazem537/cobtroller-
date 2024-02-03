from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth import authenticate, login as authLogin, logout as authlogout
from rest_framework.response import Response
from acces.models import Machines

# ,Product,CashDetail,Cash
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import timedelta

# Create your views here.
from acces.utilities import get_last_in_log, get_client_ip
from shift.models import Shift, ShiftDetail

from rest_framework.response import Response
from rest_framework.decorators import api_view

# from .serializers import CashDetailSerializer
from rest_framework import status

# custom login viwe
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import CustomLoginSerializer
from acces.serializer.machine import MachinesSerializers
from shift.serializer.user import UserSerializer
from shift.serializer.shiftdetail import ShiftDetailRetrive
from shift.serializer.shift import ShiftSerializer
from shift.utilities import active_shift


# from ipware import get_client_ip
class CustomLoginView(APIView):
    def post(self, request, *args, **kwargs):
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
        # get ip of user
        client_ip = get_client_ip(request)

        # get shift in
        shift = active_shift(request)

        # print(shift)
        if shift or user.is_superuser:
            # #  get shift detail associate with this user
            user_serializer = UserSerializer(instance=user)
            # print(user.shift.filter(shift__date=timezone.now()))

            if not user.is_superuser:
                # if shift.machine.ip != client_ip:
                #     return Response(
                #         {"error": "this is not yoyr machien "},
                #         status=status.HTTP_400_BAD_REQUEST,
                #     )
                if shift.user != user:
                    return Response(
                        {"error": "you are not in this shift or this not your pc"},
                        status=status.HTTP_404_NOT_FOUND,
                    )

                machine = shift.machine
                machine_serializer = MachinesSerializers(instance=machine)

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

        else:
            return Response(
                {
                    "error": " or this device not in shift deviceالمستخدم غير موجود في هذا الشيفت"
                },
                status=status.HTTP_400_BAD_REQUEST,
            )


# custom Signup View

from .serializers import CustomSignUpSerializer
from django.db import IntegrityError


class CustomSignUpView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CustomSignUpSerializer(data=request.data)

        if serializer.is_valid():
            username = serializer.validated_data["username"]
            password = serializer.validated_data["password"]
            try:
                user = User.objects.create_user(username=username, password=password)
                return Response(
                    {"message": "تم اضافة المستخدم بنجاح"},
                    status=status.HTTP_201_CREATED,
                )
            except IntegrityError as e:
                return Response(
                    {"error": "هذا المستخدم موجود بالفعل"},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            except Exception as e:
                print(e)
                return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


from rest_framework.permissions import IsAuthenticated, IsAdminUser


# change password
class ChangePassword(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        if not (
            request.user.is_superuser
            or request.user.username == request.data["username"]
        ):
            return Response(
                {"error": "غير مسموح لك باتمام هذه العمليه"},
                status=status.HTTP_401_UNAUTHORIZED,
            )

        serializer = CustomSignUpSerializer(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data["username"]
            new_password = serializer.validated_data["password"]
            # retrive user
            try:
                user = User.objects.get(username=username)
            except Exception as e:
                return Response(
                    {"error": "المستخدم غير موجود"}, status=status.HTTP_404_NOT_FOUND
                )

            user.set_password(new_password)
            user.save()
            return Response(
                {"message": "تم تغيير كلمة السر بنجاح"}, status=status.HTTP_200_OK
            )
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# get all users
class GetAllUsers(APIView):
    permission_classes = [IsAdminUser]

    def get(self, request, *args, **kwargs):
        normal_users = User.objects.filter(is_staff=False)
        serializer = UserSerializer(normal_users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


# shift Handel

# machines handel
from .models import Machines
from acces.serializer.machine import MachinesSerializers


class MachinesView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        machines = Machines.objects.all()
        serializer = MachinesSerializers(instance=machines, many=True)
        return Response({"data": serializer.data}, status=status.HTTP_200_OK)
