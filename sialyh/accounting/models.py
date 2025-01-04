from django.db import models
from django.contrib.auth import get_user_model

# Create your models here.

User=get_user_model()

class petty_cash (models.Model):
    
    dateInvoice=models.DateField()
    file=models.FileField()
    created=models.DateTimeField(auto_now=True)
    updated=models.DateTimeField(auto_now_add=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    enabled=models.BooleanField(default=True)

    class Meta:
        db_table='petty_cash'