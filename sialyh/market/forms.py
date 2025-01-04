from django import forms
from .models import *

class form_upload_file (forms.Form):
    file = forms.FileField(
        label='',
    )
    month = forms.ModelChoiceField(
        label= 'Base correspondiente al mes de',
        queryset = month_birthday.objects.all().order_by('id'),
        empty_label='Seleccione el mes',
        required=True,
    )
    
class form_observation (forms.ModelForm):
    class Meta:
        model = birthday_list
        fields = ['observation']

