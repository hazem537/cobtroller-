# Generated by Django 4.2.9 on 2024-01-31 18:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('acces', '0002_alter_machines_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='machines',
            name='Place',
            field=models.ForeignKey(db_column='Place_id', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='place', to='acces.place'),
        ),
    ]