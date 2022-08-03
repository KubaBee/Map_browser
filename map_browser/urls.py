from django.urls import path
from . import views



urlpatterns = [
    # path('', views.browse, name='przegladaj'),
    path('wyszukaj/', views.search, name='wyszukaj'),
    path('kontakt/', views.contact, name='kontakt'),
    path('dodaj-mape/', views.AddMapForm.as_view(), name='dodaj_mape'),
    path('edytuj/<int:pk>', views.EditMapForm.as_view(), name='edytuj'),
    path('usun/<int:pk>', views.DeleteMapView.as_view(), name='usun'),
    path('', views.MapListView.as_view(), name='przegladaj'),
    path('map/<int:pk>/', views.MapDetailView.as_view(), name='map-detail'),
    path('document/<int:pk>/', views.DocumentDetailView.as_view(), name='doc-detail')
]
