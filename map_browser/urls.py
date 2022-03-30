from django.urls import path
from . import views

urlpatterns = [
    path('', views.browse, name='przegladaj'),
    path('wyszukaj/', views.search, name='wyszukaj'),
    path('kontakt/', views.contact, name='kontakt'),
    path('dodaj-mape/', views.AddMapForm.as_view(), name='dodaj_mape'),
    ## usun to potem
]