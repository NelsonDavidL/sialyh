from django import forms
from .models import *
from django.contrib.auth.models import User


#ACA VAN LOS FORMULARIOS DE INGRESO DE DOCUMENTOS

#Este es el formulario del ingreso de las facturas manuales
class form_manual_billing(forms.ModelForm):
    numInvoice = forms.CharField(
        label='Número de factura',
        )
    dateInvoice = forms.DateField(
        label= 'Fecha de factura', 
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        )
    file = forms.FileField(
        label='Seleccione un archivo',
        )

    class Meta:
        model = manInvoice
        fields = ['numInvoice','dateInvoice','file']

    def save(self, user, commit=True):
        instance = super (form_manual_billing, self).save(commit=False)
        file = self.cleaned_data.get('file')
        if file:
            username = user
            file_name = f"{self.cleaned_data['numInvoice']}.{file.name.split('.')[-1]}"
            instance.file.name = f"{username}/manual_invoices/{file_name}"
        if commit:
            instance.save()
        return instance


#Este es el formulario del ingreso de los bonos de separado
class form_separated_bonuses(forms.ModelForm):
    numBond = forms.CharField(
        label='Bono No.  (ult. 4 dtos)',
        widget=forms.TextInput(attrs={'title': 'Por favor ingresa los ultimos cuatro digitos del bono'}),
    )
    dateInvoice = forms.DateField(
        label='Fecha de factura',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
    )
    valBond = forms.CharField(
        label='Valor del bono',
    )
    file = forms.FileField(
        label='Seleccione un archivo',
    )
    
    class Meta:
        model = sepBonuses
        fields = ['numBond','dateInvoice','valBond','file']

    def save(self, user, commit=True):
        instance = super (form_separated_bonuses, self).save(commit=False)
        file = self.cleaned_data.get('file')
        if file:
            username = user
            file_name = f"{self.cleaned_data['numBond']}.{file.name.split('.')[-1]}"
            instance.file.name = f"{username}/separate_bonuses/{file_name}"
        if commit:
            instance.save()
        return instance


#Este es el formulario del ingreso de los descuentos por nómina
class form_payroll_discount(forms.ModelForm):
    numInvoice = forms.CharField(
        label='Número de factura',
    )
    datePayDiscounts = forms.DateField(
        label='Fecha de factura',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
    )
    file = forms.FileField(
        label='Seleccione un archivo',
    )
    class Meta:
        model = payDiscounts
        fields = ['numInvoice','datePayDiscounts','file']

    def save(self, user, commit=True):
        instance = super (form_payroll_discount, self).save(commit=False)
        file = self.cleaned_data.get('file')
        if file:
            username = user
            file_name = f"{self.cleaned_data['numInvoice']}.{file.name.split('.')[-1]}"
            instance.file.name = f"{username}/payroll_discount/{file_name}"
        if commit:
            instance.save()
        return instance
    
#Este es el formulario del ingreso de manejo de datos
class form_data_management(forms.ModelForm):
    idCard = forms.IntegerField(
        label='Número de cédula',
    )
    file = forms.FileField(
        label='Seleccione un archivo',
    )
    class Meta:
        model = dataManagement
        fields = ['idCard','file']
    def save(self, user, commit=True):
        instance = super (form_data_management, self).save(commit=False)
        file = self.cleaned_data.get('file')
        if file:
            username = user
            file_name = f"{self.cleaned_data['idCard']}.{file.name.split('.')[-1]}"
            instance.file.name = f"{username}/data_management/{file_name}"
        if commit:
            instance.save()
        return instance



#ACA VAN LOS FORMULARIOS PARA LOS FILTROS DE LOS LISTADOS

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



#Este es el formulario para el filtro por fecha de manejo de datos
class date_filterFormdm(forms.Form):
    date = forms.DateField(
        label='Fecha',
        widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}),
        input_formats=["%Y-%m-%d"],
        required=False,
        )


#Este es el formulario del filtro por usuario en el listado de manejo de datos
class user_filterFormdm(forms.Form):
    user = forms.ModelChoiceField(
        label='Tienda',
        queryset=User.objects.filter(username__startswith='S').order_by('username'),
        empty_label='Seleccione una tienda',
        required=False,
        )
    
class form_upload_file (forms.Form):
    file = forms.FileField(
        label='',
    )

class form_filter_idcard(forms.Form):
    id_card = forms.CharField(
        label='Cédula',
        required=False,
    )

class form_filter_num_bond(forms.Form):
    num_bond = forms.CharField(
        label='Número de bono',
        required=False,
    )


class form_add_bond(forms.Form):

    num_bond = forms.CharField(
        label='Número de bono',
        required=True,
    )
    val_bond = forms.IntegerField(
        label='Valor del bono',
        required=True,
    )
    state = forms.ChoiceField(
        label='Estado',
        required=False,
        choices=[
            ('disponible', 'Disponible'),
            ('redimido', 'Redimido'),
        ]
    )