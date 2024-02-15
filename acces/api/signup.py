from rest_framework.decorators import api_view

from acces.serializers import CustomSignUpSerializer
from rest_framework.response import Response
from django.contrib.auth.models import User
from django.db import IntegrityError
from rest_framework import status


@api_view(["POST"])
def signup(request)   :
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

