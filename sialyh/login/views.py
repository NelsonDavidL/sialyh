from django.shortcuts import render, redirect, HttpResponse
from django.views.generic import View
from django.contrib.auth import login, authenticate, logout
from django.contrib import messages
from login.forms import *
from django.core.mail import EmailMessage
from django.contrib.auth.models import User
from sialyhapp.functions import *

# Create your views here.

#Esta es la clase que habilita el post y el get
class viewLogin (View):
    def get(self, request):
       return HttpResponse()

    def post(self,request):
      return HttpResponse()

#Esta es la vista del Login
def log_In (request):

    if request.method=="POST":
        miForm=formLogin(request.POST)
        if miForm.is_valid():
            name_user=miForm.cleaned_data.get("Usuario")
            password=miForm.cleaned_data.get("Contraseña")
            user=authenticate(username=password,password=name_user)
            if user is not None:
                login(request,user)
                return redirect ('/home/')
            else:
                messages.error(request, 'Usuario invalido')
        else:
            messages.error=(request,'Información erronea')
    
    miForm=formLogin()
    return render (request, "login.html", {"form":miForm})

#Esta es la vista del Logout
def log_Out(request):
    logout(request)
    return redirect ('Home')


#Esta es la vista de envio de contraseña
def rem_password(request):
    formrp = formRemPass()

    if request.method=="POST":
        formrp=formRemPass(data=request.POST)
        if formrp.is_valid():
            user = request.POST.get ("Usuario")
            password = obtain_password(user)
            email = obtain_email(user)

        email = EmailMessage (
            "Recodatorio de contraseña",
            "Estimada administradora. \n \nEstos son los datos de ingreso al aplicativo:\n\nUsuario: {} \nContraseña: {}".format(user,password),
            "sialyh@outlook.com",
            [email])
        try:
            email.send()
            return redirect ("login")
        except:
            return redirect ("login")

    return render (request, "registration/remember_pass.html", {"formrp": formrp})