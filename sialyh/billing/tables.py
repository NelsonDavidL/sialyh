import django_tables2 as tables
from .models import manInvoice
from django.contrib.auth.models import User

#Esta es la tabla que muestra la lista de facturas ingresadas desde el formulario de ingreson de facturas manuales
class manInvoiceTable(tables.Table):
    
    numInvoice = tables.Column(verbose_name='Numero de factura')
    dateInvoice = tables.Column(verbose_name='Fecha de factura')
    user = tables.Column(verbose_name='Usuario')

    class Meta:
        model = manInvoice
        template_name = 'django_tables2/bootstrap4.html' 
        attrs = {'class': 'table table-bordered', 'style': 'color: black; text-align: center; width: 80%;'}
        exclude = ('id', 'created', 'updated')