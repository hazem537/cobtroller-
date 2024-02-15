# Generated by Django 5.0.1 on 2024-02-14 21:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gates', '0002_alter_gate_ip_alter_gate_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='gate',
            name='pc_ip',
            field=models.CharField(default='192.168.1.5', max_length=50, unique=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='gate',
            name='cam_in_ip',
            field=models.CharField(max_length=50, unique=True),
        ),
        migrations.AlterField(
            model_name='gate',
            name='cam_out_ip',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]
