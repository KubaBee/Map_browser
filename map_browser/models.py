import os.path
from django.db import models
from django.conf import settings
from PIL import Image
from django.core.files.storage import default_storage as storage
from io import BytesIO
from django.core.files.base import ContentFile

# Create your models here.


class People(models.Model):
    first_name = models.CharField(max_length=80, blank=True)
    last_name = models.CharField(max_length=80, blank=True)

    def __str__(self):
        return f'{self.first_name} {self.last_name}'

    unique_together = [['first_name', 'last_name']]


class Archive(models.Model):
    archive_name = models.CharField(max_length=200, blank=True)
    archive_team = models.CharField(max_length=200, blank=True)
    archive_unit = models.CharField(max_length=200, blank=True)
    archive_number = models.CharField(max_length=200, blank=True)

    def __str__(self):
        return f'{self.archive_name}/{self.archive_team}/{self.archive_unit}/{self.archive_number}'

    unique_together = [['archive_name', 'archive_team', 'archive_unit', 'archive_number']]


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
    authors = models.ManyToManyField(People, null=True)
    corrector_id = models.ForeignKey(People, blank=True, null=True,
                                     on_delete=models.SET_NULL, related_name="%(class)s_corrector")
    language_id = models.ManyToManyField(Languages, blank=True, null=True)
    archive_id = models.ForeignKey(Archive, blank=True, null=True, on_delete=models.SET_NULL)
    publication_place = models.ForeignKey(PublicationPlaces, blank=True, null=True, on_delete=models.SET_NULL)
    added_at = models.DateTimeField(auto_now_add=True)
    creator = models.ManyToManyField(settings.AUTH_USER_MODEL)
    full_title = models.CharField(max_length=500, blank=True)
    short_title = models.CharField(max_length=500, blank=True)
    publishing_address = models.CharField(max_length=300, blank=True)
    scale = models.CharField(blank=True, default='1', max_length=500)
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

    def save(self, *args, **kwargs):

        if not self.make_thumbnail():
            raise Exception("Error when creating a thumbnail")

        super(Map, self).save(*args, **kwargs)

    def make_thumbnail(self):

        img = Image.open(self.filename)
        img.thumbnail((916, 624), Image.ANTIALIAS)
        thumb_name, thumb_extension = os.path.splitext(self.filename.name)
        thumb_extension = thumb_extension.lower()
        thumb_filename = thumb_name + '_copy' + thumb_extension

        if thumb_extension == '.jpg':
            FTYPE = 'JPEG'
        else:
            return False

        temp_thumb = BytesIO()
        img.save(temp_thumb, FTYPE)
        temp_thumb.seek(0)

        self.thumbnail.save(thumb_filename, ContentFile(temp_thumb.read()), save=False)
        temp_thumb.close()

        return True
