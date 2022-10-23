from django import forms
from . import models
from django.contrib.auth import get_user_model
from crispy_forms.helper import FormHelper
from crispy_forms.bootstrap import Tab, TabHolder, FieldWithButtons, StrictButton
from crispy_forms.layout import Layout, Submit, Div, HTML
from crispy_bootstrap5.bootstrap5 import FloatingField
from django.core.exceptions import ValidationError
import django_filters


class CustomMMCF(forms.ModelMultipleChoiceField):
    def label_from_instance(self, creator):
        if creator.__class__.__name__ == 'People' or creator.__class__.__name__ == "User":
            return f"{creator.last_name} {creator.first_name}"


class PeopleForm(forms.ModelForm):
    class Meta:
        model = models.People
        fields = '__all__'

        labels = {
            "last_name": "Nazwisko",
            "first_name": "Imie",
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super().clean()
        first_name = bool(cleaned_data.get('first_name', False))
        last_name = bool(cleaned_data.get('last_name', False))
        if first_name is False and last_name is False:
            raise ValidationError("Obydwie wartości nie mogą być puste")
        return cleaned_data


class ArchiveForm(forms.ModelForm):
    class Meta:
        model = models.Archive
        fields = ['archive_name', 'archive_team', 'archive_unit', 'archive_number']

        labels = {
            "archive_name": "Nazwa Archiwum",
            "archive_team": "Zespół Archiwalny",
            "archive_unit": "Jednostka Archiwalna",
            "archive_number": "Numer",
        }


class MapForm(forms.ModelForm):
    class Meta:
        model = models.Map
        fields = ['full_title', 'short_title', 'creator', 'subject_type', 'filename', 'link', 'archive_id',
                  'publishing_address', 'scale', 'subject', 'authors', 'creation_type',
                  'description', 'keyword_name', 'keyword_subject', 'keyword_geo', 'additional_notes', 'language_id']

        labels = {
            "full_title": "Tytuł Pełny",
            "short_title": "Tytuł Skrócony",
            "filename": "Plik Mapy",
            "link": "Link do Mapy",
            "creator": "Osoba Dodająca",
            "publishing_address": "Miejsce Wydania",
            "scale": "Skala (mianownik)",
            "subject": "Przedmiot Mapy",
            "subject_type": "Rodzaj",
            "creation_type": "Rodzaj mapy ze względu na sposób wykonania",
            "description": "Opis",
            "keyword_name": "Słowa Kluczowe Imienne",
            "keyword_subject": "Słowa Kluczowe Rzeczowe",
            "keyword_geo": "Słowa Kluczowe Geograficzne",
            "additional_notes": "Dodatkowe Informacje",
            "archive_id": "Archiwum",
            "authors": "Autorzy",
            "language_id": "Język Mapy"
        }

        help_texts = {
            "link": "Wypełnij to pole TYLKO jeśli mapa jest przechowywana w zewnętrzynym zasobie"
        }


class DocumentForm(forms.ModelForm):
    class Meta:
        model = models.Document
        fields = ["title", "description", "authors", "creator", "created_at", "language_id", "receiver",
                  "archive_id", "keyword_name", "keyword_subject", "keyword_geo", "source_reference",
                  "is_statistic_data", "is_map", "link", "doc_file", "translation_file", "volume", "doc_format",
                  "source_type"]

        labels = {
            "title": "Tytuł Pełny",
            "description": "Opis",
            "authors": "Autorzy",
            "creator": "Osoba Dodająca",
            "created_at": "Data Powstania",
            "language_id": "Język Dokumentu",
            "receiver": "Adresat",
            "archive_id": "Archiwum",
            "keyword_name": "Słowa Kluczowe Imienne",
            "keyword_subject": "Słowa Kluczowe Rzeczowe",
            "keyword_geo": "Słowa Kluczowe Geograficzne",
            "source_reference": "Odwołanie do źróła",
            "is_statistic_data": "Zawiera dane statystyczne",
            "is_map": "Zawiera mapę",
            "link": "Link do dokumentu",
            "doc_file": "Dokument",
            "translation_file": "Tłumaczenie",
            "volume": "Objętość (liczba stron)",
            "doc_format": "Format dokumentu",
            "source_type": "Typ Źródła",
        }

        help_texts = {
            "link": "Wypełnij to pole TYLKO jeśli dokument jest przechowywany w zewnętrzynym zasobie"
        }



    # creator = CustomMMCF(
    #     queryset=get_user_model().objects.all(),
    #     widget=forms.CheckboxSelectMultiple
    # )

    # def __init__(self, *args, **kwargs):
    #     super().__init__(*args, **kwargs)
    #     self.helper = FormHelper()
    #     self.helper.layout = Layout(
    #         TabHolder(
    #             Tab('Informacje o mapie', 'short_title', 'full_title', 'creator', 'subject', 'scale', 'filename',
    #                 'description', 'publishing_address', 'subject_type', 'creation_type', 'keyword_name',
    #                 'keyword_subject', 'keyword_geo', 'additional_notes'),
    #             Tab('Informacje o autorach i archiwim', 'authors', HTML(
    #                 """<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#authorModal">Add new author</button>"""),
    #                 'archive_id',
    #                 HTML("""<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#archiveModal">Dodaj nowe archiwum</button>"""))),
    #         HTML("""<button type="submit" name="{{ map_form.prefix }}" class="btn btn-primary">Submit</button>"""))




















