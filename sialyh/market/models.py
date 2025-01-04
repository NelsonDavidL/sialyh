from django.db import models

# Create your models here.

class month_birthday (models.Model):
    month = models.CharField(max_length=64)

    class Meta:
        db_table = 'month_birthday'

    def __str__(self):
        return self.month

class birthday_list (models.Model):
    user = models.CharField(max_length=64, null=True, blank=True)
    month = models.ForeignKey(month_birthday, on_delete=models.CASCADE)
    day = models.CharField(max_length=64, null=True, blank=True)
    line = models.CharField(max_length=64, null=True, blank=True)
    client = models.CharField(max_length=64, null=True, blank=True)
    phone = models.BigIntegerField(null=True, blank=True)
    observation = models.CharField(max_length=64, null=True, blank=True)

    class Meta:
        db_table='birthday_list'


