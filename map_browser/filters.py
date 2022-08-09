import django_filters
from django import forms
from .models import Map


class MapFilter(django_filters.FilterSet):

    class Meta:
        model = Map
        fields = {
            'full_title': ['icontains'],
            'keyword_geo': ['icontains']
        }
