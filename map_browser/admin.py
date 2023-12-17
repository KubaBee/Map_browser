from django.contrib import admin
from .models import (
    Map,
    SubjectTypes,
    PublicationPlaces,
    Languages,
    Archive,
    People,
    Document,
)
from adminsortable2.admin import SortableAdminMixin


# admin.site.register(Map)
@admin.register(Map)
class MapAdmin(SortableAdminMixin, admin.ModelAdmin):
    ordering = ['my_order']


# admin.site.register(Document)
@admin.register(Document)
class DocumentAdmin(SortableAdminMixin, admin.ModelAdmin):
    ordering = ['my_order']


admin.site.register(SubjectTypes)
admin.site.register(PublicationPlaces)
admin.site.register(Languages)
admin.site.register(Archive)
admin.site.register(People)
