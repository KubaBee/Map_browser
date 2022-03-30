from django.db import models
from django.conf import settings
# Create your models here.


class People(models.Model):
    first_name = models.CharField(max_length=30, blank=True)
    last_name = models.CharField(max_length=30, blank=True)


class Archive(models.Model):
    archive_name = models.CharField(max_length=100, blank=True)
    archive_team = models.CharField(max_length=100, blank=True)
    archive_unit = models.CharField(max_length=100, blank=True)
    archive_number = models.CharField(max_length=100, blank=True)


class Languages(models.Model):
    language_code = models.CharField(max_length=4, blank=True)
    language_name = models.CharField(max_length=30, blank=True)


class PublicationPlaces(models.Model):
    country_name = models.CharField(max_length=40, blank=True)
    city_name = models.CharField(max_length=40, blank=True)


class Map(models.Model):
    filename = models.FileField(upload_to='maps')
    authors = models.ManyToManyField(People, null=True)
    corrector_id = models.ForeignKey(People, blank=True, null=True,
                                     on_delete=models.SET_NULL, related_name="%(class)s_corrector")
    language_id = models.ForeignKey(Languages, blank=True, null=True, on_delete=models.SET_NULL)
    archive_id = models.ForeignKey(Archive, blank=True, null=True, on_delete=models.SET_NULL)
    publication_place = models.ForeignKey(PublicationPlaces, blank=True, null=True, on_delete=models.SET_NULL)
    created_at = models.DateTimeField(auto_now_add=True)
    creator = models.ManyToManyField(settings.AUTH_USER_MODEL)
    full_title = models.CharField(max_length=200, blank=True)
    short_title = models.CharField(max_length=50, blank=True)
    publishing_address = models.CharField(max_length=100, blank=True)
    scale = models.IntegerField(blank=True, default=1)
    subject = models.CharField(max_length=100, blank=True)
    subject_type = models.CharField(max_length=100, blank=True)
    creation_type = models.CharField(max_length=100, blank=True)
    description = models.TextField(blank=True)
    keyword_name = models.CharField(max_length=200, blank=True)
    keyword_subject = models.CharField(max_length=200, blank=True)
    keyword_geo = models.CharField(max_length=200, blank=True)
    additional_notes = models.TextField(blank=True)

