from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.

@login_required
def home (request):
    return render (request, "sialyhapp/home.html")

@login_required
def permission_denied(request):
    return render (request, "sialyhapp/permission_denied.html")