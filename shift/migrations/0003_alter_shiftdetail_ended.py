# Generated by Django 4.2.9 on 2024-01-31 18:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shift', '0002_alter_shiftdetail_ended'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shiftdetail',
            name='ended',
            field=models.BooleanField(default=False, null=True),
        ),
    ]