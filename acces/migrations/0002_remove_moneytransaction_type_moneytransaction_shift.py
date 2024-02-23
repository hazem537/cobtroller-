# Generated by Django 5.0.1 on 2024-02-22 12:39

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('acces', '0001_initial'),
        ('shift', '0002_alter_shiftdetail_unique_together_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='moneytransaction',
            name='type',
        ),
        migrations.AddField(
            model_name='moneytransaction',
            name='shift',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='transaction', to='shift.shiftdetail'),
        ),
    ]