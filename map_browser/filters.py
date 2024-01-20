import django_filters
from .models import People, SubjectTypes, Languages


class MapFilter(django_filters.FilterSet):
    full_title = django_filters.CharFilter(lookup_expr='icontains', label="Tytuł pełny")

    short_title = django_filters.CharFilter(
        lookup_expr='icontains', label="Tytuł skrócony"
    )

    language_id = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Język mapy", queryset=Languages.objects.all()
    )

    keyword_name = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe imienne'
    )

    keyword_subject = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe przedmiotowe'
    )

    keyword_geo = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe geograficzne'
    )

    authors = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Autorzy", queryset=People.objects.all()
    )

    subject_type = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Tematyka", queryset=SubjectTypes.objects.all()
    )


class DocumentFilter(django_filters.FilterSet):
    title = django_filters.CharFilter(lookup_expr='icontains', label="Tytuł")

    language_id = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Język dokumentu", queryset=Languages.objects.all()
    )

    keyword_name = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe imienne'
    )

    keyword_subject = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe przedmiotowe'
    )

    keyword_geo = django_filters.CharFilter(
        lookup_expr='icontains', label='Słowa kluczowe geograficzne'
    )

    authors = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Autorzy", queryset=People.objects.all()
    )

    source_type = django_filters.ModelMultipleChoiceFilter(
        lookup_expr='exact', label="Typ źródła", queryset=SubjectTypes.objects.all()
    )
