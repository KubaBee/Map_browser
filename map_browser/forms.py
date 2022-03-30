from django import forms
from . import models
from django.contrib.auth import get_user_model
from crispy_forms.helper import FormHelper
from crispy_forms.bootstrap import Tab, TabHolder, FieldWithButtons, StrictButton
from crispy_forms.layout import Layout, Submit, Div, HTML
from crispy_bootstrap5.bootstrap5 import FloatingField
from django.core.exceptions import ValidationError


class CustomMMCF(forms.ModelMultipleChoiceField):
    def label_from_instance(self, creator):
        if creator.__class__.__name__ == 'People' or creator.__class__.__name__ == "User":
            return f"{creator.first_name} {creator.last_name}"


class ArchiveMCF(forms.ModelChoiceField):
    def label_from_instance(self, obj):
        return f"{obj.archive_name}/{obj.archive_team}/{obj.archive_unit}/{obj.archive_number}"


class MapForm(forms.ModelForm):
    class Meta:
        model = models.Map
        fields = ['filename', 'creator', 'archive_id', 'full_title', 'short_title', 'publishing_address',
                  'scale', 'subject', 'subject_type', 'subject_type', 'authors', 'creation_type',
                  'description', 'keyword_name', 'keyword_subject', 'keyword_geo', 'additional_notes']

    creator = CustomMMCF(
        queryset=get_user_model().objects.all(),
        widget=forms.CheckboxSelectMultiple
    )

    authors = CustomMMCF(
        queryset=models.People.objects.all(),
        widget=forms.SelectMultiple()
    )

    archive_id = ArchiveMCF(
        queryset=models.Archive.objects.all()
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
            # Div(
            #     Div('filename', 'creator', 'short_title', 'authors', 'archive_id'),
            # ),
            # Submit('submit', 'Submit'),
            TabHolder(
                Tab('Informacje o mapie', 'creator', 'short_title', 'filename'),
                Tab('Informacje o archiwim', FieldWithButtons('authors'), HTML(
                    """<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Dodaj nowego autora</button>""")),
                Tab('Informacje o autorach', 'archive_id')
            )
        )


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
        self.fields["first_name"].label = "Imię autora"
        self.fields["last_name"].label = "Nazwisko autora"

    def clean(self):
        cleaned_data = super().clean()
        first_name = bool(cleaned_data.get('first_name', False))
        last_name = bool(cleaned_data.get('last_name', False))
        print(f'Method worksssssss {first_name}//{last_name}')
        if first_name is False and last_name is False:
            raise ValidationError("Obydwie wartości nie mogą być puste")
        return cleaned_data
