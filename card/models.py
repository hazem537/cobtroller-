from email.policy import default
from django.db import models
import math
from django.utils import timezone
# from cash.models import Cash

from datetime import timedelta
# from gates.models import Gate
from django.db import transaction
# from shift.models import ShiftDetail

class Category(models.Model):
    name = models.CharField(max_length=50)
    intial_duration = models.DurationField(blank=True, null=True)
    intial_price = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    then_duration = models.DurationField(blank=True, null=True)
    then_price = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    discount_duration = models.DurationField(blank=True, null=True)
    discount_price = models.DecimalField(
        max_digits=5, decimal_places=2, blank=True, null=True
    )
    isExcept = models.BooleanField(default=False)
    isSubscription = models.BooleanField(default=False)
    # sub_amount = models.DecimalField(
    #     max_digits=5, decimal_places=2, null=True, blank=True
    # )

    def save(self, *args, **kwargs):
        if self.discount_duration is None:
            self.discount_duration = timedelta(days=1)
            self.discount_price = 0
        if self.then_duration is None:
            self.then_duration = timedelta(hours=1)
            self.then_price = self.intial_price
        super().save(*args, **kwargs)

    @staticmethod
    def get_default_category():
        obj_cat, created = Category.objects.get_or_create(
            name="زائر",
            defaults={"intial_duration": timedelta(hours=3), "intial_price": 5},
        )
        return obj_cat

    def __str__(self) -> str:
        return f"{self.name} -- {self.intial_duration} *{self.intial_price} has "


class ParkingCard(models.Model):
    num = models.CharField(max_length=20, unique=True)
    category = models.ForeignKey(
        "Category", related_name="card", on_delete=models.CASCADE, null=True, blank=True
    )

    def __str__(self) -> str:
        if hasattr(self, "sub"):
            return f"craed_no = {self.num}  has sub {self.sub} "
        else:
            return f"craed_no = {self.num}  "

    def save(self, *args, **kwargs):
        if self.category is None:
            obj_cat, created = Category.objects.get_or_create(
                name="زائر",
                defaults={"intial_duration": timedelta(hours=1), "intial_price": 5},
            )
            if created:
                obj_cat.save()
            self.category = obj_cat

        super().save(*args, **kwargs)


class Subscription(models.Model):
    card = models.OneToOneField(
        "ParkingCard", related_name="sub", on_delete=models.CASCADE
    )
    start_date = models.DateField(
        auto_now=False, auto_now_add=False, null=True, blank=True
    )
    end_date = models.DateField(
        auto_now=False, auto_now_add=False, null=True, blank=True
    )

    def is_active(self):
        # Subscription.objects.filter(pk=self.pk,start_date__lte=timezone.now(),end_date__gt=timezone.now()).exists()
        return Subscription.objects.filter(
            pk=self.pk, start_date__lte=timezone.now(), end_date__gt=timezone.now()
        ).exists()

    def __str__(self) -> str:
        return f"  {self.start_date}  ---  { self.end_date} "


class SubscriptionPayment(models.Model):
    card = models.ForeignKey(
        "ParkingCard", related_name="sub_payment", on_delete=models.CASCADE
    )
    subscription_package = models.ForeignKey(
        "SubscriptionPackage", related_name="payment", on_delete=models.CASCADE
    )
    created_at = models.DateField(auto_now=False, auto_now_add=True)

    def __str__(self) -> str:
        return f"  {self.created_at}  ---  { self.subscription_package} "


class SubscriptionPackage(models.Model):
    duration = models.DurationField()
    cost = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self) -> str:
        return f" {self.duration}  ---  { self.cost} "


class ParkingSession(models.Model):
    card = models.ForeignKey(
        ParkingCard,
        related_name="parking_session",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    category = models.ForeignKey(
        Category,
        related_name="parking_session",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    check_in_time = models.DateTimeField(
        auto_now=False, auto_now_add=False, default=timezone.now
    )
    gate_in = models.ForeignKey(
        "gates.Gate", related_name="parking_in", on_delete=models.CASCADE
    )
    gate_out = models.ForeignKey(
        "gates.Gate",
        related_name="parking_out",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    check_out_time = models.DateTimeField(
        auto_now=False, auto_now_add=False, blank=True, null=True
    )
    duration = models.DurationField(null=True, blank=True)
    amount_paied = models.DecimalField(
        max_digits=10, decimal_places=2, null=True, blank=True
    )
    offer = models.DecimalField(
        max_digits=10, decimal_places=2, default=0, null=True, blank=True
    )
    lost_card = models.BooleanField(default=False)
    cash = models.ForeignKey(
        "cash.Cash", related_name="detail", on_delete=models.CASCADE, null=True
    )
    from django.contrib.auth.models import User
    cashire = models.ForeignKey(
        User, related_name="cash", on_delete=models.CASCADE, null=True
    )
    shift_in =models.ForeignKey("shift.ShiftDetail", related_name="session_in",null=True,blank=True, on_delete=models.CASCADE)
    shift_out =models.ForeignKey("shift.ShiftDetail", related_name="session_out",null=True,blank=True, on_delete=models.CASCADE)
    
    image_in = models.ImageField(
        upload_to="image",
        null=True,
        blank=True,
        height_field=None,
        width_field=None,
        max_length=None,
    )
    image_out = models.ImageField(
        upload_to="image",
        null=True,
        blank=True,
        height_field=None,
        width_field=None,
        max_length=None,
    )
    done = models.BooleanField(default=False)

    def save(self, *args, **kwargs):

        s_trans = ParkingSession.objects.filter(card=self.card, done= False).exclude(
            id=self.pk
        )
        if s_trans:
            if not  self.lost_card:
                raise ValueError("this card is alrady in ")

        if self.lost_card:
            card_lost_cat, created = Category.objects.get_or_create(
                name="lost card",
                defaults={"intial_duration": timedelta(hours=1), "intial_price": 6.25},
            )
            self.category = card_lost_cat

        if self.category is None:
            self.category = self.card.category
        super().save(*args, **kwargs)

    @staticmethod
    def get_last_session(card_no):
        try:
            s_parking_session = ParkingSession.objects.filter(
                card__num=card_no, done=False
            ).latest("check_in_time")

            return s_parking_session
        except Exception as e:
            print(e)
            return None

    @staticmethod
    def calc_time(card_no):
        try:
            s_session: ParkingSession = ParkingSession.get_last_session(card_no)

            duration = timezone.now() - s_session.check_in_time

            # duration = math.ceil(duration.total_seconds() //3600)
            return duration

        except Exception as e:
            print(e)
            return None

    def calc_payment(self):
        with transaction.atomic():
            self.check_out_time = timezone.now()
            if self.lost_card == True:
                duration = timedelta(days=1)
            else:
                duration = ParkingSession.calc_time(self.card.num)
            self.duration = duration
            #   check if this category  is EXcept
            if self.category.isExcept:
                amount = 0
                self.amount_paied = 0
                self.save()
                return amount
            elif self.category.isSubscription :
                amount = 0
                self.amount_paied = 0
                self.save()
                return amount
            else:
                if self.category.isSubscription:
                    self.category = Category.get_default_category()

                if duration < self.category.intial_duration:
                    amount = self.category.intial_price
                elif duration < self.category.discount_duration:
                    amount = (
                        math.ceil(
                            (duration - self.category.intial_duration).total_seconds()
                            / (self.category.then_duration.total_seconds())
                        )
                        * self.category.then_price
                        + self.category.intial_price
                    )
                else:
                    amount = (
                        math.ceil(
                            (duration - self.category.intial_duration).total_seconds()
                            / (self.category.then_duration.total_seconds())
                        )
                        * self.category.then_price
                        + self.category.intial_price
                        - self.category.discount_price
                    )
                self.amount_paied = amount
                self.save()
                return amount

    def __str__(self) -> str:
        return f"{self.card.num if self.card else 'lostcard' }  -- {self.check_in_time} ---{ self.check_out_time} -- { math.ceil(self.duration.total_seconds()/3600 ) if self.duration else 0 }"
