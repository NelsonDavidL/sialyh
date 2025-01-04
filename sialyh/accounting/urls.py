from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    path('', views.accountingView, name="accounting"),
    path('income_accounting', views.income_accounting_view, name="income_accounting"),
    path('listings_accounting', views.listings_accounting_view, name="listings_accounting"),
    path('income_accounting/petty_cash', views.petty_cashView, name="petty_cash"),
    path('listings_accounting/petty_cash_list', views.petty_cash_list, name="petty_cash_list"),
    path('listings_accounting/petty_cash_list/disabled_item_petty_cash/<int:invoice_id>', views.disable_item_petty_cash, name="disabled_item_petty_cash"),
    
]

urlpatterns+=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)