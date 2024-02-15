# Generated by Django 5.0.1 on 2024-02-08 22:06

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('card', '0005_remove_parkingcard_subscription_subscription_card'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subscriptionpayment',
            name='subscription',
        ),
        migrations.AddField(
            model_name='subscriptionpayment',
            name='card',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='sub_payment', to='card.parkingcard'),
            preserve_default=False,
        ),
    ]
