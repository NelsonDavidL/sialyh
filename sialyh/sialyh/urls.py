"""sialyh URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('sialyhapp.urls')),
    path('home/', include('sialyhapp.urls')),

    #Urls de app login
    path('login/', include('login.urls')),
    path('rem_password/', include('login.urls')),
    path('accounts/', include('django.contrib.auth.urls')),

    #Urls de app billing
    path('income/', include('billing.urls')),
    path('listings/', include('billing.urls')),
    path('bid_bonds/', include('billing.urls')),
    path('upload_bonds/', include('billing.urls')),
    path('truncate_bonds/', include('billing.urls')),
    path('export_bonds/', include('billing.urls')),
    path('bind_bond_list/', include('billing.urls')),
    path('bond_management/', include('billing.urls')),
    path('add_bond/', include('billing.urls')),
    path('update_bond/', include('billing.urls')),
    path('delete_bond/', include('billing.urls')),
    path('disabled_item_invoice/', include('billing.urls')),
    path('invoices/', include('billing.urls')),
    path('export_invoices_excel/', include('billing.urls')),
    path('payDiscountslist/', include('billing.urls')),
    path('sepBonuseslist/', include('billing.urls')),
    path('disabled_item_sepBond/', include('billing.urls')),
    path('export_sepBonuses_to_excel/', include('billing.urls')),
    path('manual_invoices/', include('billing.urls')),
    path('sepBonuses/', include('billing.urls')),
    path('payDiscounts/', include('billing.urls')),
    path('export_payDiscounts_to_excel/', include('billing.urls')),
    path('disabled_item_payDiscount/', include('billing.urls')),
    path('dataManagement/', include('billing.urls')),
    path('dataManagementlist/', include('billing.urls')),
    path('export_dataManagement_to_excel/', include('billing.urls')),
    path('billing/', include('billing.urls')),
    
    #Urls de app human_resources
    path('applications/', include('human_resources.urls')),
    path('application/', include('human_resources.urls')),
    path('approvals/', include('human_resources.urls')),
    path('approval/', include('human_resources.urls')),
    path('list_approval/', include('human_resources.urls')),
    path('approve_application/', include('human_resources.urls')),
    path('disable_application/', include('human_resources.urls')),
    path('consultation/', include('human_resources.urls')),
    path('human_resources/', include('human_resources.urls')),

    #Urls de app accounting
    path('disabled_item_petty_cash/', include('accounting.urls')),
    path('petty_cash_list/', include('accounting.urls')),
    path('petty_cash/', include('accounting.urls')),
    path('listings_accounting/', include('accounting.urls')),
    path('income_accounting/', include('accounting.urls')),
    path('accounting/', include('accounting.urls')),

    #Urls de app market
    path('insert_observation/', include('market.urls')),
    path('list_birthday/', include('market.urls')),
    path('truncate_list/', include('market.urls')),
    path('upload_list/', include('market.urls')),
    path('market/', include('market.urls')),

]
urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)