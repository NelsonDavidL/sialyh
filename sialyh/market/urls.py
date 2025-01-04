from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from . import views
from .views import *




urlpatterns = [
    path('', views.view_market, name="market"),
    path('export_list_birthday', views.export_list_birthday, name="export_list_birthday"),
    path('insert_observation/<int:birth_id>/', views.insert_observation, name="insert_observation"),
    path('list_birthday', views.list_birthday, name="list_birthday"),
    path('truncate_list', views.truncate_list, name="truncate_list"),
    path('upload_list', views.upload_file, name="upload_list"),
    ]  
