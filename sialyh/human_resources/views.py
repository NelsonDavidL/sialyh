from django.shortcuts import render, redirect
from .forms import *
from django.contrib.auth.decorators import login_required
from django.core.files.base import ContentFile
from .models import *
from django.contrib import messages
from django.views.generic import UpdateView
from django.urls import reverse_lazy
from django.http import HttpResponse, JsonResponse
from sialyhapp.functions import *
import base64



# Create your views here.

@login_required
def human_resourcesView(request):
    return render(request, "human_resources/human_resources.html")

@login_required
def applicationsView(request):
    return render(request, "human_resources/applications.html")

@login_required
def approvalsView(request):
    return render(request, "human_resources/approvals.html")

@login_required
def applicationView(request):
    if request.method == 'POST':
        # Informacion de la solicitud
        name = request.POST.get('name')
        idCard = request.POST.get('idCard')
        date = request.POST.get('date')
        user = request.user
        signature = request.POST.get('signature')
        subtotal = request.POST.get('subtotal')
        total = request.POST.get('total')
        authorization = request.POST.get('authorization') == 'on'

        application = applications(name=name, idCard=idCard, date=date, user=user, signature=signature, subtotal=subtotal, total=total, authorization=authorization)
        application.save()

        # Información del detalle de la solicitud
        references = request.POST.getlist('reference')
        details = request.POST.getlist('detail')
        amounts = request.POST.getlist('amount')
        unitVals = request.POST.getlist('unitVal')
        totalVals = request.POST.getlist('totalVal')

        # Verifica si se han enviado todos los detalles
        if len(references) == len(details) == len(amounts) == len(unitVals) == len(totalVals):
            for i in range(len(references)):
                detApplication = detApplications(
                    application=application, 
                    reference=references[i],
                    detail=details[i],
                    amount=amounts[i],
                    unitVal=unitVals[i],
                    totalVal=totalVals[i]
                )
                detApplication.save()
        else:
            return render(request, 'payroll_discounts/application.html', {'error': 'Por favor, complete todos los campos del detalle'})

        return redirect('application')
    else:
        return render(request, 'payroll_discounts/application.html')

@login_required
def list_approval_view(request):
    form_list_app = applications.objects.all()

    user_filter_formapp = application_filter_Form(request.GET)

    if user_filter_formapp.is_valid():
        user = user_filter_formapp.cleaned_data.get('user')

        if user:
            form_list_app = form_list_app.filter(user__username=user)
        return render (request, 'payroll_discounts/application_list.html', {
            'form_list_app':form_list_app,
            'user_filter_formapp':user_filter_formapp,
            })
            
    return render (request, 'payroll_discounts/application_list.html', {
        'form_list_app':form_list_app,
        'user_filter_formapp':user_filter_formapp,
        })

@login_required
def approvalView(request, app_id):
    try:
        formdet = detApplications.objects.filter(application_id=app_id)
        formapp = applications.objects.filter(id=app_id)
        encode_signature = applications.objects.get(id=app_id)
        signature = encode_signature.signature.split(',')[1]
    except:
        pass

    return render(request, "payroll_discounts/approval.html" , {
        'formapp':formapp,
        'formdet':formdet,
        'signature':signature,
    })



@login_required
def approveApp (request, app_id):
    application = applications.objects.get(id=app_id)
    application.approved = True
    application.user_approved = request.user
    application.save()
    return redirect ('list_approval')



@login_required
def disableApp (request, app_id):
    application = applications.objects.get(id=app_id)
    application.enabled = not application.enabled
    application.save()
    return redirect ('list_approval')


@login_required
def consultation (request):
    formapp = applications.objects.filter(user=request.user)
    return render (request, 'payroll_discounts/consultation.html', {'formapp':formapp})