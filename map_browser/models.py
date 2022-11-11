import os.path
from django.db import models
from django.conf import settings
from PIL import Image
from io import BytesIO
from django.core.validators import FileExtensionValidator
from django.core.files.base import ContentFile


class People(models.Model):
    first_name = models.CharField(max_length=80, blank=True)
    last_name = models.CharField(max_length=80, blank=True)

    def __str__(self):
        return f'{self.last_name} {self.first_name}'

    unique_together = [['last_name', 'first_name']]


class Archive(models.Model):
    archive_name = models.CharField(max_length=200, blank=True)
    archive_team = models.CharField(max_length=200, blank=True)
    archive_unit = models.CharField(max_length=200, blank=True)
    archive_number = models.CharField(max_length=200, blank=True)

    def __str__(self):
        return f'{self.archive_name}/{self.archive_team}/{self.archive_unit}/{self.archive_number}'

    unique_together = [
        ['archive_name', 'archive_team', 'archive_unit', 'archive_number']
    ]


class Languages(models.Model):
    language_code = models.CharField(max_length=4, blank=True)
    language_name = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return f'{self.language_name}'


class PublicationPlaces(models.Model):
    country_name = models.CharField(max_length=100, blank=True)
    city_name = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return f'{self.country_name} {self.city_name}'


class SubjectTypes(models.Model):
    name = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return f'{self.name}'


class Map(models.Model):
    filename = models.ImageField(upload_to='maps/')
    thumbnail = models.ImageField(upload_to='thumbnails/')
    link = models.URLField(verbose_name="Link do Mapy", null=True, blank=True)
    authors = models.ManyToManyField(People, null=True)
    corrector_id = models.ForeignKey(
        People,
        blank=True,
        null=True,
        on_delete=models.SET("N/A"),
        related_name="%(class)s_corrector",
    )
    language_id = models.ManyToManyField(Languages, blank=True, null=True)
    archive_id = models.ForeignKey(
        Archive, blank=True, null=True, on_delete=models.SET("N/A")
    )
    publication_place = models.ForeignKey(
        PublicationPlaces, blank=True, null=True, on_delete=models.SET("N/A")
    )
    added_at = models.DateTimeField(auto_now_add=True)  # bez exportu
    creator = models.ManyToManyField(settings.AUTH_USER_MODEL)  # bez exportu
    full_title = models.CharField(max_length=500, blank=True)
    short_title = models.CharField(max_length=500, blank=True)
    publishing_address = models.CharField(max_length=300, blank=True)
    scale = models.CharField(
        blank=True, default='1', max_length=500
    )  # add scale with ints
    subject = models.CharField(max_length=500, blank=True)
    creation_type = models.CharField(max_length=500, blank=True)
    subject_type = models.ManyToManyField(SubjectTypes, blank=True, null=True)
    description = models.TextField(blank=True)
    keyword_name = models.CharField(max_length=500, blank=True)
    keyword_subject = models.CharField(max_length=500, blank=True)
    keyword_geo = models.CharField(max_length=500, blank=True)
    additional_notes = models.TextField(blank=True)
    created_at = models.CharField(blank=True, max_length=150)
    source_text = models.CharField(blank=True, max_length=500)

    def __str__(self):
        if self.full_title is not None:
            return f"{self.id}. {self.full_title}"
        elif self.full_title is None and self.short_title is not None:
            return f"{self.id}. {self.short_title}"
        else:
            return f"{self.id} --;--"

    def save(self, *args, **kwargs):

        if not self.make_thumbnail():
            raise Exception("Error when creating a thumbnail")
        super(Map, self).save(*args, **kwargs)

    def make_thumbnail(self):

        img = Image.open(self.filename)
        img.thumbnail((916, 624))
        thumb_name, thumb_extension = os.path.splitext(self.filename.name)
        thumb_extension = thumb_extension.lower()
        thumb_filename = thumb_name + '_copy' + thumb_extension

        if thumb_extension == '.jpg':
            FTYPE = 'JPEG'
        elif thumb_extension == '.png':
            FTYPE = "PNG"
        else:
            return False

        temp_thumb = BytesIO()
        img.save(temp_thumb, FTYPE)
        temp_thumb.seek(0)

        self.thumbnail.save(thumb_filename, ContentFile(temp_thumb.read()), save=False)
        temp_thumb.close()

        return True


class Document(models.Model):
    title = models.CharField(max_length=250, verbose_name="Tytuł")
    description = models.TextField(blank=True, verbose_name="Opis dokumentu")
    added_at = models.DateTimeField(auto_now_add=True)
    authors = models.ManyToManyField(People, null=True, verbose_name="Autorzy")
    creator = models.ManyToManyField(
        settings.AUTH_USER_MODEL, verbose_name="Osoba wprowadzająca dane"
    )
    created_at = models.CharField(
        blank=True, max_length=150, verbose_name="Data powstania"
    )
    language_id = models.ManyToManyField(Languages, blank=True, verbose_name="Język/i")
    receiver = models.ManyToManyField(
        People, blank=True, verbose_name="Adresat", related_name="receiver_id"
    )
    archive_id = models.ForeignKey(
        Archive, blank=True, on_delete=models.SET("N/A"), verbose_name="Archiwum"
    )
    keyword_name = models.CharField(
        max_length=500, blank=True, verbose_name="Słowa kluczowe imienne"
    )
    keyword_subject = models.CharField(
        max_length=500, blank=True, verbose_name="Słowa kluczowe rzeczowe"
    )
    keyword_geo = models.CharField(
        max_length=500, blank=True, verbose_name="Słowa kluczowe geograficzne"
    )
    source_reference = models.ManyToManyField(
        Map, blank=True, verbose_name="Odwołanie do mapy źródłowej"
    )
    is_statistic_data = models.BooleanField(
        blank=True, verbose_name="Czy znajdują się dane statystyczne?"
    )
    is_map = models.BooleanField(
        blank=True, verbose_name="Czy znajdują się mapy tekstowe?"
    )
    link = models.URLField(verbose_name="Link do dokumentu", null=True, blank=True)
    doc_file = models.FileField(
        verbose_name="Dokument",
        blank=True,
        upload_to='documents/',
        validators=[
            FileExtensionValidator(
                ['pdf'],
                message="Podany format nie jest obsługiwany. Akceptowane są tylko pliki .pdf",
            )
        ],
    )
    translation_file = models.FileField(
        verbose_name="Tłumaczenie",
        blank=True,
        upload_to='translations/',
        validators=[
            FileExtensionValidator(
                ['pdf'],
                message="Podany format nie jest obsługiwany. Akceptowane są tylko pliki .pdf",
            )
        ],
    )
    volume = models.IntegerField(verbose_name="Liczba/objętość", blank=True, null=True)
    doc_format = models.CharField(
        max_length=150, blank=True, verbose_name="Forma dokumentu"
    )
    source_type = models.CharField(
        max_length=150, blank=True, verbose_name="Typ źródła"
    )

    def __str__(self):
        return self.title
