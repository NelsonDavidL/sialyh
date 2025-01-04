from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import *
from .models import *


# Create your views here.

@login_required
def accountingView(request):
    return render (request, 'accounting/accounting.html')

@login_required
def income_accounting_view(request):
    return render (request, 'accounting/income_pettycash.html')

@login_required
def listings_accounting_view(request):
    return render (request, 'accounting/list_pettycash.html')



@login_required
def petty_cashView(request):
    if request.method == 'POST':
        formpc = form_petty_cash(request.POST, request.FILES)
        formpc_list = petty_cash.objects.filter(user=request.user)
        if formpc.is_valid():
            pet_cash = formpc.save(commit=False, user=request.user)
            pet_cash.user = request.user
            pet_cash.save()
            messages.success(request, 'Información enviada correctamente.')
            return redirect('petty_cash')
    else:
        formpc = form_petty_cash()
        formpc_list = petty_cash.objects.filter(user=request.user)
    return render (request, 'petty_cash/petty_cash.html', {
        'formpc':formpc,
        'formpc_list':formpc_list,
        })


@login_required
def petty_cash_list(request):
    
    miForm = petty_cash.objects.all()
    # Aca se inicializan los formularios de filtro
    start_date_filter_form = form_start_date(request.GET)
    end_date_filter_form = form_end_date(request.GET)
    user_filter_form = form_user_filter(request.GET)
    # Aca se verifica si los formularios son válidos
    if start_date_filter_form.is_valid() and end_date_filter_form.is_valid() and user_filter_form.is_valid():
        
        start_date_invoice = start_date_filter_form.cleaned_data.get('start_date')
        end_date_invoice = end_date_filter_form.cleaned_data.get('end_date')
        user_filter = user_filter_form.cleaned_data.get('user')
        # Aca se filtra el queryset de manInvoice
        if start_date_invoice and end_date_invoice:
            miForm = miForm.filter(dateInvoice__range=(start_date_invoice, end_date_invoice))
        if user_filter:
            miForm = miForm.filter(user__username=user_filter)
        # Aca se renderiza la plantilla con los objetos filtrados y los formularios de filtro
        return render(request, 'petty_cash/petty_cash_list.html', {
            'miForm': miForm,
            'start_date_filter_form': start_date_filter_form,
            'end_date_filter_form': end_date_filter_form,
            'user_filter_form': user_filter_form,
        })
    else:
        return render(request, 'petty_cash/petty_cash_list.html', {
            'miForm': miForm,
            'start_date_filter_form': start_date_filter_form,
            'end_date_filter_form': end_date_filter_form,
            'user_filter_form': user_filter_form,
        })


@login_required
def disable_item_petty_cash(request, invoice_id):
    pettycash = petty_cash.objects.get(id=invoice_id)
    pettycash.enabled = not pettycash.enabled
    pettycash.save()
    return redirect('petty_cash_list')