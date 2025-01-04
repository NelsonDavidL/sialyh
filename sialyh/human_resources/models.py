from django.db import models
from django.contrib.auth import get_user_model

# Create your models here.

User=get_user_model()

class applications (models.Model):

    name = models.CharField(max_length=64)
    idCard = models.PositiveIntegerField()
    date = models.DateField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    signature = models.TextField()
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)
    subtotal = models.IntegerField()
    total = models.IntegerField()
    approved = models.BooleanField(default=False)
    authorization = models.BooleanField(default=False)
    enabled = models.BooleanField(default=True)
    user_approved = models.ForeignKey(User, on_delete=models.CASCADE, related_name='approved_applications', null=True, blank=True)

    class Meta:
        db_table = 'applications'

class detApplications (models.Model):

    application = models.ForeignKey(applications, on_delete=models.CASCADE)
    reference = models.CharField(max_length=64)
    detail = models.CharField(max_length=64)
    amount = models.IntegerField()
    unitVal = models.IntegerField()
    totalVal = models.IntegerField()

    class Meta:
        db_table = 'detApplications'