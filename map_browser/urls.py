from django.urls import path
from . import views

urlpatterns = [
    path('', views.default_redirect, name='pusty'),
    path('wyszykaj-mape/', views.FilterMapView.as_view(), name='wyszukaj-mape'),
    path(
        'wyszykaj-dokument/',
        views.FilterDocumentView.as_view(),
        name='wyszukaj-dokument',
    ),
    path('map/<int:pk>/', views.MapDetailView.as_view(), name='szczegoly-mapy'),
    path('dodaj-mape/', views.AddMapForm.as_view(), name='dodaj_mape'),
    path('edytuj-mape/<int:pk>/', views.EditMapForm.as_view(), name='edytuj-mape'),
    path('usun-mape/<int:pk>/', views.DeleteMapView.as_view(), name='usun-mape'),
    path(
        'edytuj-dokument/<int:pk>/',
        views.EditDocumentForm.as_view(),
        name='edytuj-dokument',
    ),
    path(
        'usun-dokument/<int:pk>/',
        views.DeleteDocumentView.as_view(),
        name='usun-dokument',
    ),
    path('mapy/', views.MapListView.as_view(), name='przegladaj-mapy'),
    path('dokumenty/', views.DocumentListView.as_view(), name='przegladaj-dokumenty'),
    path('dodaj-dokument/', views.AddDocumentForm.as_view(), name='dodaj-dokument'),
    path(
        'document/<int:pk>/',
        views.DocumentDetailView.as_view(),
        name='szczegoly-dokumenty',
    ),
    path('mapy-raport/', views.map_csv_export, name='eksport-map'),
    path('dokumenty-raport/', views.doc_csv_export, name='eksport-dokumentow'),
]
