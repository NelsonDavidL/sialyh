import django_filters
from django.contrib.auth.models import User
from .models import manInvoice , sepBonuses

#Estos son los filtros por fecha y usuario usados en los formularios del filtro de listado de facturas
class manInvoiceFilter(django_filters.FilterSet):
    
    dateInvoices = django_filters.ModelChoiceFilter(
        field_name='dateInvoice',
        queryset=manInvoice.objects.all(),
        label='Fecha de factura',
    )

    user = django_filters.ModelChoiceFilter(
        field_name='user',
        queryset=User.objects.all(),
        label='Usuario',
    )

    class Meta:
        model = manInvoice
        fields = ['user','dateInvoice']


#Estos son los filtros por fecha y usuario usados en los formularios del filtro de listado de bonos de separado
class sepBonusesFilter(django_filters.FilterSet):
    
    dateBonuses = django_filters.ModelChoiceFilter(
        field_name='dateInvoice',
        queryset=sepBonuses.objects.all(),
        label='Fecha de factura',
    )

    user = django_filters.ModelChoiceFilter(
        field_name='user',
        queryset=User.objects.all(),
        label='Usuario',
    )

    class Meta:
        model = sepBonuses
        fields = ['user','dateInvoice']
