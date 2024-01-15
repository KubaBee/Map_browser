from django.contrib import admin
from .models import (
    Map,
    SubjectTypes,
    PublicationPlaces,
    Languages,
    Archive,
    People,
    Document,
    Category
)
from adminsortable2.admin import SortableAdminMixin


# admin.site.register(Map)
@admin.register(Map)
class MapAdmin(SortableAdminMixin, admin.ModelAdmin):
    ordering = ['my_order']
    list_display = ('my_order', 'id', 'full_title', 'get_category_summary')  # Add your additional column here

    def get_category_summary(self, obj):
        # Assuming you have a ManyToManyField named 'many_to_many_field' in YourModel
        categories = obj.category.all()
        summary = ", ".join(str(category) for category in categories)
        return summary

    get_category_summary.short_description = 'Złączone Kategorie'


@admin.register(Document)
class DocumentAdmin(SortableAdminMixin, admin.ModelAdmin):
    ordering = ['my_order']
    list_display = ('my_order', 'id', 'title', 'get_category_summary')  # Add your additional column here

    def get_category_summary(self, obj):
        # Assuming you have a ManyToManyField named 'many_to_many_field' in YourModel
        categories = obj.category.all()
        summary = ", ".join(str(category) for category in categories)
        return summary

    get_category_summary.short_description = 'Złączone Kategorie'


admin.site.register(SubjectTypes)
admin.site.register(PublicationPlaces)
admin.site.register(Languages)
admin.site.register(Archive)
admin.site.register(People)
admin.site.register(Category)
