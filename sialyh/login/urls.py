from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('', log_In, name="login"),
    path('logout', log_Out, name="logout"),
    path('rem_password', rem_password, name="rem_password"),

]

urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)