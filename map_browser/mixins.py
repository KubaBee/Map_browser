from django.shortcuts import get_object_or_404
from django.contrib.auth.mixins import UserPassesTestMixin
from .models import Map, Document
from django.http import HttpResponse


class ActiveObjectFilterMixin:

    def get_queryset(self):
        queryset = super().get_queryset()
        if not self.request.user.is_authenticated:
            queryset = queryset.filter(is_active=True)
        return queryset

    def get_object(self, queryset=None):
        if not self.request.user.is_authenticated:
            obj = get_object_or_404(self.model, pk=self.kwargs['pk'], is_active=True)
        else:
            obj = get_object_or_404(self.model, pk=self.kwargs['pk'])

        return obj

    def filter_queryset(self, qs):
        # Get the model name
        model_name = qs.model._meta.model_name
        title = self.request.GET.get("title")

        if title:
            if model_name == 'map':
                return qs.filter(full_title__icontains=title)
            elif model_name == 'document':
                return qs.filter(title__icontains=title)

        return qs


class FilterViewMixin:
    filter_class = None
    template_name = None
    paginate_by = 6

    def get_context_data(self, **kwargs):
        obj_list = self.filter_class(self.request.GET, queryset=self.get_queryset())
        context = super().get_context_data(
            object_list=obj_list.qs.order_by('-added_at'),
            **kwargs
        )
        context['filter'] = obj_list
        return context