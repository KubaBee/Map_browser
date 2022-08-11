import django_filters
from django import forms
from .models import Map, People, SubjectTypes, Languages


class MapFilter(django_filters.FilterSet):
    full_title = django_filters.CharFilter(lookup_expr='icontains', label="Tytuł Pełny")

    short_title = django_filters.CharFilter(lookup_expr='icontains', label="Tytuł Skrócony")

    language_id = django_filters.ModelMultipleChoiceFilter(lookup_expr='exact',
                                                        label="Język Mapy",
                                                        queryset=Languages.objects.all())

    keyword_name = django_filters.CharFilter(lookup_expr='icontains', label='Słowa kluczowe imienne')

    keyword_subject = django_filters.CharFilter(lookup_expr='icontains', label='Słowa kluczowe przedmiotowe')

    keyword_geo = django_filters.CharFilter(lookup_expr='icontains', label='Słowa kluczowe geograficzne')

    authors = django_filters.ModelMultipleChoiceFilter(lookup_expr='exact',
                                                       label="Autorzy",
                                                       queryset=People.objects.all())

    subject_type = django_filters.ModelMultipleChoiceFilter(lookup_expr='exact',
                                                            label="Tematyka",
                                                            queryset=SubjectTypes.objects.all())

    # class Meta:
    #     model = Map
    #     fields = ['full_title', 'authors', 'subject_type']

    # def __init__(self, *args, **kwargs):
    #     super(MapFilter, self).__init__(*args, **kwargs)
    #     self.filters['authors'].label = "Autorzy"
    #     self.filters['subject_type'].label = "Temat Mapy"
    #     self.filters['full_title'].label = "Tytuł Pełny"
