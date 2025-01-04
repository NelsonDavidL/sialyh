from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('', views.human_resourcesView, name="human_resources"),
    path('applications', views.applicationsView, name="applications"),
    path('approvals', views.approvalsView, name="approvals"),
    path('application', views.applicationView, name="application"),
    path('disable_app/<int:app_id>/', views.disableApp, name="disable_application"),
    path('approval_app/<int:app_id>/', views.approveApp, name="approve_application"),
    path('consultation', views.consultation, name="consultation"),
    path('list_approval', views.list_approval_view, name="list_approval"),
    path('approval/<int:app_id>/', views.approvalView, name="approval"),

]  

urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)