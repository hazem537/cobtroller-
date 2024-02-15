from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
from django.contrib.auth.models import User
from acces.serializers import CustomSignUpSerializer


@permission_classes([IsAuthenticated])
@api_view(["POST"])
def change_password(request):
    if not (
        request.user.is_superuser or request.user.username == request.data["username"]
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
