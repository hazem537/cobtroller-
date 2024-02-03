from itertools import product
import stat
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated ,IsAdminUser
from cash.models import Cash, CashDetail
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from acces.models import Log
from django.utils import timezone
from cash.serializers.cash import CashSerializer
from cash.serializers.cashdetail import CashDetailSerializer, addCashDetailSerializer ,CashDetailOfferSerializer
from shift.models import ShiftDetail
from shift.utilities import active_shift

class CashDetailView(generics.CreateAPIView):
    permission_classes = IsAuthenticated
    serializer_class = CashDetailSerializer
    queryset = CashDetail.objects.all()


@permission_classes([IsAuthenticated])
@api_view(["GET"])
def add_card_lost(request):
    # get acyive shift 
    shift =active_shift(request)
    new_cash_detail =CashDetail.objects.create(
        card_no =0,
        time_out = timezone.now(),
        machine_out =shift.machine,
        product="card_lost",
        product_cost=5,
        cash=shift.cash,
        duration= 24,
        total =24*5,
        card_lost=True,
        cashier=request.user
    )
    new_detail=new_cash_detail.save()
    serializer = CashSerializer(instance=shift.cash)
    print(serializer.data)
    return Response({"cash":serializer.data,"payment_id":new_cash_detail.id},status=status.HTTP_200_OK)


@permission_classes([IsAdminUser])
@api_view(["DELETE"])
def remove_card_lost(request,id):
    try:
        selectde_cash_detail  =CashDetail.objects.get(id=id ,card_lost=True)
        selectde_cash_detail.delete()
        return Response({"message":"delete done"},status=status.HTTP_200_OK)
    except Exception as e:
        print(e)
        return Response({"error":"no card lost  found "},status=status.HTTP_404_NOT_FOUND)
        
    


@permission_classes([IsAdminUser])
@api_view(["POST"])
def add_offer(request,id):
    data= request.data
    try:
        selected_cash_detail = CashDetail.objects.get(id=id)
        if(data["offer"]<=selected_cash_detail.total):
            selected_cash_detail.offer = data['offer']
        else:
            selected_cash_detail.offer = selected_cash_detail.total
        
        selected_cash_detail.save()
                
        return Response({"message":"Update Offer Done"},status=status.HTTP_200_OK)
    except Exception as e:  
        print(e)
        return Response({"error":"cash detail not found"},status=status.HTTP_404_NOT_FOUND)
        



@permission_classes([IsAuthenticated])
@api_view(["GET"])
def get_cash_detail(request,id):
    print(id)
    try:
        detail = CashDetail.objects.get(id=id)
        serializer = CashDetailOfferSerializer(instance=detail)
        return Response({"detail":serializer.data},status=status.HTTP_200_OK)
    except Exception as e:
        return Response({"error":"this detailnot exist "},status=status.HTTP_400_BAD_REQUEST)




from shift.utilities import active_shift


@permission_classes([IsAuthenticated])
@api_view(["POST"])
def addCashDetail(request):
    serializer = addCashDetailSerializer(data=request.data)
    if serializer.is_valid():
        log_id = serializer.validated_data.pop("log_id", None)
        selected_log = Log.objects.get(id=log_id)
        serializer.validated_data["time_in"] = selected_log.time
        serializer.validated_data["machine_in"] = selected_log.device
        serializer.validated_data["cashier"] = request.user
        shift_cash = (
            active_shift(request)
            .cash
        )
        serializer.validated_data["cash"] = shift_cash

        new_detail = serializer.save()
        print(new_detail)
        cashSer = CashSerializer(shift_cash)

        return Response(
            {"cash": cashSer.data, "payment_id": new_detail.id},
            status=status.HTTP_200_OK,
        )

    # print(serializer.errors)
    return Response({"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
