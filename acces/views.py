from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from shift.serializer.user import UserSerializer
from rest_framework.permissions import IsAdminUser
from rest_framework import generics

# get all users
class GetAllUsers(generics.ListAPIView):
    permission_classes = [IsAdminUser]

    def get(self, request, *args, **kwargs):
        normal_users = User.objects.filter(is_staff=False)
        serializer = UserSerializer(normal_users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
