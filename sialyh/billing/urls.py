from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('', views.billingView, name="billing"),
    path('income', views.incomeView, name="income"),
    path('listings', views.listingsView, name="listings"),
    path('bid_bonds', views.bidBonsView, name="bid_bonds"),
    path('bid_bonds/upload_bonds', views.upload_bonds, name="upload_bonds"),
    path('bid_bonds/truncate_bonds', views.truncate_list, name="truncate_bonds"),
    path('bid_bonds/export_bonds', views.export_list_bond, name="export_bonds"),
    path('bid_bonds/bind_bond_list', views.bind_bond_list, name="bind_bond_list"),
    path('bid_bonds/update_bond/<int:bond_id>', views.update_bond, name="update_bond"),
    path('bid_bonds/bond_management', views.bondManagement, name="bond_management"),
    path('bid_bonds/management_update_bond/<int:bond_id>', views.management_update_bond, name="management_update_bond"),
    path('bid_bonds/add_bond/<id_Card>', views.add_bond, name="add_bond"),
    path('bid_bonds/delete_bond/<int:bond_id>', views.delete_bond, name="delete_bond"),
    path('income/manual_invoices', views.manual_invoicesView, name="manual_invoices"),
    path('income/sepBonuses', views.sep_bonusesView, name="sepBonuses"),
    path('income/payDiscounts', views.pay_discountsView, name="payDiscounts"),
    path('income/dataManagement', views.data_managementView, name="dataManagement"),
    path('listings/dataManagementlist', views.dataManagement_list, name="dataManagementlist"),
    path('listings/dataManagement/export_dataManagement_to_excel', views.export_dataManagement_to_excel, name="export_dataManagement_to_excel"),
    path('listings/invoices', views.invoice_list, name="invoices"),
    path('listings/invoices/export_invoices_excel', views.export_invoices_to_excel, name="export_invoices_excel"),
    path('listings/invoices/disabled_item/<int:invoice_id>/', views.disable_item_manInvoice, name="disabled_item_invoice"),
    path('listings/sepBonuseslist', views.sepBonuses_list, name="sepBonuseslist"),
    path('listings/sepBonuseslist/export_sepBonuses_to_excel', views.export_sepBonuses_to_excel, name="export_sepBonuses_to_excel"),
    path('listings/sepBonuseslist/disabled_item_sepBond/<int:bond_id>/', views.disable_item_sepBonuses, name="disabled_item_sepBond"),
    path('listings/payDiscountslist', views.payDiscounts_list, name="payDiscountslist"),
    path('listings/payDiscountslist/export_payDiscounts_to_excel', views.export_payDiscounts_to_excel, name="export_payDiscounts_to_excel"),
    path('listings/payDiscountslist/disabled_item_payDiscount/<int:payd_id>/', views.disable_item_payDiscount, name="disabled_item_payDiscount"),
]   
urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)