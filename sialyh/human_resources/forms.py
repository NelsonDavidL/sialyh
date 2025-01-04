from django import forms
from .models import *
from django.contrib.auth.models import User


class form_application(forms.ModelForm):
    name = forms.CharField(
        label='NOMBRE ',
    )
    idCard = forms.IntegerField(
        label='CEDULA ',
    )
    date = forms.DateField(
        label='FECHA ',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        required=False,
    )
    subtotal = forms.IntegerField(
        label= 'SUB TOTAL',
    )
    total = forms.IntegerField(
        label = 'TOTAL',
    )
    
    authorization = forms.BooleanField(
        label= 'Autorizacion descuento'
    )

    class Meta:
        model = applications
        fields = ['name','idCard','date','subtotal','total','authorization']

class form_det_application(forms.ModelForm):

    reference = forms.CharField(
        label='Referencia'
    )
    detail = forms.CharField(
        label='Detalle'
    )
    amount = forms.IntegerField(
        label='Cantidad'
    )
    unitVal = forms.IntegerField(
        label='Valor unitario'
    )
    totalVal = forms.IntegerField(
        label='Valor total',
        disabled=True,
    )

    class Meta:
        model = detApplications
        fields = ['reference','detail','amount','unitVal','totalVal']


    
class application_filter_Form(forms.Form):
    user = forms.ModelChoiceField(
        label='Tienda',
        queryset=User.objects.all(),
        empty_label='Seleccione una tienda',
        required=False,
        )


