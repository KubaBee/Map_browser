from django import forms
from . import models
from django.core.exceptions import ValidationError


class CustomMMCF(forms.ModelMultipleChoiceField):
    def label_from_instance(self, creator):
        if (
                creator.__class__.__name__ == 'People'
                or creator.__class__.__name__ == "User"
        ):
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
    related_docs = forms.ModelMultipleChoiceField(queryset=models.Document.objects.all(),
                                                  required=False,
                                                  widget=forms.SelectMultiple,
                                                  label="Powiązane dokumenty")

    created_at = forms.CharField(label='Data utworzenia',
                                 widget=forms.TextInput(attrs={'placeholder': '1900'}))

    publication_place = None

    class Meta:
        model = models.Map
        fields = [
            'full_title',
            'short_title',
            'creator',
            'corrector_id',
            'publication_place',
            'created_at',
            'subject_type',
            'filename',
            'link',
            'archive_id',
            'source',
            'geoportal_url',
            'publishing_address',
            'scale',
            'subject',
            'authors',
            'creation_type',
            'description',
            'keyword_name',
            'keyword_subject',
            'keyword_geo',
            'additional_notes',
            'language_id',
            'related_docs',
            "is_active"
        ]

        labels = {
            "full_title": "Tytuł",
            "short_title": "Tytuł alternatywny",
            "filename": "Plik mapy",
            "link": "Link do mapy",
            "creator": "Osoba dodająca",
            "corrector_id": "Korektor",
            "publishing_address": "Miejsce wydania",
            "publication_place": "Wydawnictwo",
            "scale": "Skala (mianownik)",
            "subject": "Przedmiot mapy",
            "subject_type": "Rodzaj",
            "creation_type": "Rodzaj mapy ze względu na sposób wykonania",
            "description": "Opis",
            "keyword_name": "Słowa kluczowe imienne",
            "keyword_subject": "Słowa kluczowe rzeczowe",
            "keyword_geo": "Słowa kluczowe geograficzne",
            "additional_notes": "Dodatkowe informacje",
            "archive_id": "Archiwum",
            "source": "Źródło Mapy",
            "geoportal_url": "Link do mapy w Geo Portalu",
            "authors": "Autorzy",
            "language_id": "Język",
            "related_docs": 'Powiązane dokumenty'
        }

        help_texts = {
            "link": "Wypełnij to pole TYLKO jeśli mapa jest przechowywana w zewnętrzynym zasobie",
            "creator": "Aby odznaczyć lub zaznaczyć więcej niż jeden przytrzymaj CTRL",
            "source": "Podaj źródło mapy lub archiwum",
            "geoportal_url": "Jeśli link nie istnieje, zostaw to pole puste",
            "filename": "Wybierz plik mapy jeśli ma ona być przechowywana w aplikacji"
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.pk:
            self.fields['related_docs'].initial = self.instance.document_set.all()


class DocumentForm(forms.ModelForm):
    class Meta:
        model = models.Document
        fields = [
            "title",
            "description",
            "authors",
            "creator",
            "created_at",
            "language_id",
            "receiver",
            "thumbnail",
            "archive_id",
            "keyword_name",
            "keyword_subject",
            "keyword_geo",
            "source_reference",
            "is_statistic_data",
            "is_map",
            "link",
            "doc_file",
            "translation_file",
            "volume",
            "doc_format",
            "source_type",
            "is_active",
        ]

        labels = {
            "title": "Tytuł",
            "description": "Opis",
            "authors": "Autorzy",
            "creator": "Osoba dodająca",
            "created_at": "Data powstania",
            "language_id": "Język dokumentu",
            "receiver": "Adresat",
            "thumbnail": "Miniaturka",
            "archive_id": "Archiwum",
            "keyword_name": "Słowa kluczowe imienne",
            "keyword_subject": "Słowa kluczowe rzeczowe",
            "keyword_geo": "Słowa kluczowe geograficzne",
            "source_reference": "Odwołanie do źróła kartograficznego",
            "is_statistic_data": "Zawiera dane statystyczne",
            "is_map": "Zawiera mapę",
            "link": "Link do dokumentu",
            "doc_file": "Dokument",
            "translation_file": "Tłumaczenie",
            "volume": "Objętość (liczba stron)",
            "doc_format": "Format dokumentu",
            "source_type": "Typ źródła",
        }

        help_texts = {
            "link": "Wypełnij to pole TYLKO jeśli dokument jest przechowywany w zewnętrzynym zasobie"
        }

# class RelatedDocs(forms.Form):
#     related_doc = forms.ModelMultipleChoiceField(
#         queryset=models.Document.objects.all(),
#         widget=forms.SelectMultiple()
#     )

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
