from django.db import models

# Create your models here.


class modules (models.Model):
    module = models.CharField(max_length=50)

    class Meta:
        db_table = 'modules'


class incomes (models.Model):
    incomes = models.CharField(max_length=50)

    class Meta:
        db_table = 'incomes'

class listings (models.Model):
    listings = models.CharField(max_length=50)

    class Meta:
        db_table = 'listings'
