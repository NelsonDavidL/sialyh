from django import forms
from .models import *
from django.contrib.auth.models import User
from datetime import date, datetime
import datetime


class form_petty_cash(forms.ModelForm):
    current_month = datetime.datetime.now().strftime('%Y-%m')
    first_day_of_month = datetime.datetime.now().replace(day=1).strftime('%Y-%m-%d')
    last_day_of_month = datetime.datetime.now().replace(day=datetime.datetime.now().day).strftime('%Y-%m-%d')

    dateInvoice = forms.DateField(
        label='Fecha de factura',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date', 'value': current_month, 'min': first_day_of_month, 'max': last_day_of_month,}),
        input_formats=["%Y-%m-%d"],
    )
    file = forms.FileField(
        label='Seleccione un archivo',
    )

    def save(self, user, commit=True):
        instance = super (form_petty_cash, self).save(commit=False)
        file = self.cleaned_data.get('file')
        if file:
            username = user
            file_name = f"{self.cleaned_data['dateInvoice']}.{file.name.split('.')[-1]}"
            instance.file.name = f"{username}/petty_cash/{file_name}"
        if commit:
            instance.save()
        return instance
    
    class Meta:
        model = petty_cash
        fields = ['dateInvoice','file']


class form_start_date(forms.Form):
    start_date = forms.DateField(
        label='Fecha inicial',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        required=False,
        )

class form_end_date(forms.Form):
    end_date = forms.DateField(
        label='Fecha final',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        required=False,
        )
        
class form_user_filter(forms.Form):
    user = forms.ModelChoiceField(
        label='Tienda',
        queryset=User.objects.filter(username__startswith='S').order_by('username'),
        empty_label='Seleccione una tienda',
        required=False,
        )

class date_filterFormpc(forms.Form):
    dateInvoice = forms.DateField(
        label='Fecha de factura',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        required=False,
        )
    
class user_filterFormpc(forms.Form):
    user = forms.ModelChoiceField(
        label='Tienda',
        queryset=User.objects.filter(username__startswith='S').order_by('username'),
        empty_label='Seleccione una tienda',
        required=False,
        )
