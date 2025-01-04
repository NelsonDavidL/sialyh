from django.db import models
from django.contrib.auth import get_user_model
from sialyhapp.functions import *

User=get_user_model()

# Create your models here.

#Este es el modelo de la tabla de las facturas manuales en base de datos (manInvoices)
class manInvoice(models.Model):
    numInvoice=models.PositiveIntegerField()
    dateInvoice=models.DateField(null=True,blank=True)
    file=models.FileField(max_length=500)
    created=models.DateTimeField(auto_now=True)
    updated=models.DateTimeField(auto_now_add=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    enabled=models.BooleanField(default=True)

    class Meta:
        db_table='manInvoice'



#Este es el modelo de la tabla de los descuentos por nómina en base de datos (payDiscounts)
class payDiscounts(models.Model):
    numInvoice=models.PositiveIntegerField()
    datePayDiscounts=models.DateField(null=True,blank=True)
    file=models.FileField(max_length=500)
    created=models.DateTimeField(auto_now=True)
    updated=models.DateTimeField(auto_now_add=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    enabled=models.BooleanField(default=True)

    class Meta:
        db_table='payDiscounts'


#Este es el modelo de la tabla de los bonos de separado en base de datos (sepBonuses)
class sepBonuses(models.Model):
    numBond=models.PositiveBigIntegerField()
    dateInvoice=models.DateField(null=True,blank=True)
    valBond=models.PositiveIntegerField()
    file=models.FileField(max_length=500)
    created=models.DateTimeField(auto_now=True)
    updated=models.DateTimeField(auto_now_add=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    enabled=models.BooleanField(default=True)

    class Meta :
        db_table='sepBonuses'


#Este es el modelo de la tabla de manejo de datos en base de datos (dataManagement)
class dataManagement(models.Model):
    idCard=models.PositiveIntegerField()
    file=models.FileField(max_length=500)
    created=models.DateField(auto_now=True)
    updated=models.DateField(auto_now_add=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    enabled=models.BooleanField(default=True)

    class Meta:
        db_table='dataManagement'

class bindBonds(models.Model):
    idCard=models.CharField(max_length=50)
    bidding=models.CharField(max_length=50)
    numBond=models.CharField(max_length=100, null=True, blank=True,)
    value=models.PositiveIntegerField(null=True, blank=True,)
    state=models.CharField(
        max_length=30,
        choices=[
            ('disponible', 'Disponible'),
            ('redimido', 'Redimido'),
        ],
        default='disponible',
    )
    user=models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    created=models.DateField(auto_now=True)
    updated=models.DateField(auto_now_add=True)
    redemptionDate=models.DateField(null=True, blank=True, default=None)

    class Meta:
        db_table='bindBonds'
        constraints = [
            models.UniqueConstraint(
                fields=['numBond', 'idCard'], name='unique_numBond_idCard'
            )
        ]