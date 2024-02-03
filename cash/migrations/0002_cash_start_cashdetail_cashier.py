# Generated by Django 4.2.9 on 2024-01-31 21:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('cash', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='cash',
            name='start',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=15),
        ),
        migrations.AddField(
            model_name='cashdetail',
            name='cashier',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, related_name='cash_detail', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]