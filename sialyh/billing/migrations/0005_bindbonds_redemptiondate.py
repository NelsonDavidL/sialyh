# Generated by Django 3.2 on 2024-12-13 01:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('billing', '0004_auto_20241212_1956'),
    ]

    operations = [
        migrations.AddField(
            model_name='bindbonds',
            name='redemptionDate',
            field=models.DateField(blank=True, default=None, null=True),
        ),
    ]
