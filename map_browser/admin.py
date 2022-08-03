from django.contrib import admin
from .models import Map, SubjectTypes, PublicationPlaces, Languages, Archive, People, Document

# Register your models here.

admin.site.register(Map)
admin.site.register(SubjectTypes)
admin.site.register(PublicationPlaces)
admin.site.register(Languages)
admin.site.register(Archive)
admin.site.register(People)
admin.site.register(Document)