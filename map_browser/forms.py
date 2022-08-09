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
            return f"{creator.first_name} {creator.last_name}"


class MapForm(forms.ModelForm):
    class Meta:
        model = models.Map
        fields = ['filename', 'creator', 'archive_id', 'full_title', 'short_title', 'publishing_address',
                  'scale', 'subject', 'subject_type', 'authors', 'creation_type', 'authors',
                  'description', 'keyword_name', 'keyword_subject', 'keyword_geo', 'additional_notes']

    creator = CustomMMCF(
        queryset=get_user_model().objects.all(),
        widget=forms.CheckboxSelectMultiple
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
            TabHolder(
                Tab('Informacje o mapie', 'short_title', 'full_title', 'creator', 'subject', 'scale', 'filename',
                    'description', 'publishing_address', 'subject_type', 'creation_type', 'keyword_name',
                    'keyword_subject', 'keyword_geo', 'additional_notes'),
                Tab('Informacje o autorach i archiwim', 'authors', HTML(
                    """<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#authorModal">Add new author</button>"""),
                    'archive_id',
                    HTML("""<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#archiveModal">Dodaj nowe archiwum</button>"""))),
            HTML("""<button type="submit" name="{{ map_form.prefix }}" class="btn btn-primary">Submit</button>"""))


class ArchiveForm(forms.ModelForm):
    class Meta:
        model = models.Archive
        fields = ['archive_name', 'archive_team', 'archive_unit', 'archive_number']


class PeopleForm(forms.ModelForm):
    class Meta:
        model = models.People
        # fields = ['first_name', 'last_name']
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["first_name"].label = 'Author First Name'#"Imię autora"
        self.fields["last_name"].label = 'Author Last Name'#"Nazwisko autora"

    def clean(self):
        cleaned_data = super().clean()
        first_name = bool(cleaned_data.get('first_name', False))
        last_name = bool(cleaned_data.get('last_name', False))
        if first_name is False and last_name is False:
            raise ValidationError("Obydwie wartości nie mogą być puste")
        return cleaned_data














