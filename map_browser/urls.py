from django.urls import path
from . import views
from .models import Map

urlpatterns = [
    path('', views.default_redirect, name='pusty'),
    path('wyszykaj-mape/', views.FilterMapView.as_view(), name='wyszukaj'),
    path('kontakt/', views.contact, name='kontakt'),
    path('dodaj-mape/', views.AddMapForm.as_view(), name='dodaj_mape'),
    path('edytuj/<int:pk>', views.EditMapForm.as_view(), name='edytuj'),
    path('usun/<int:pk>', views.DeleteMapView.as_view(), name='usun'),
    path('mapy/', views.MapListView.as_view(), name='przegladaj-mapy'),
    path('dokumenty/', views.DocumentListView.as_view(), name='przegladaj-dokumenty'),
    path('map/<int:pk>/', views.MapDetailView.as_view(), name='map-detail'),
    path('document/<int:pk>/', views.DocumentDetailView.as_view(), name='doc-detail'),
]
