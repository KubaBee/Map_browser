import requests
from django.shortcuts import render, redirect, reverse
from django.views.generic import CreateView, UpdateView, DeleteView
from .forms import MapForm, PeopleForm, ArchiveForm
from .models import Map, Archive, People, Document
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic.list import ListView, MultipleObjectMixin
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.forms.models import modelformset_factory
from django.urls import reverse_lazy
from django.db.models import Q
from .filters import MapFilter
from itertools import chain
from django.core.paginator import Paginator


class MapListView(ListView, MultipleObjectMixin):
    model = Map
    template_name = 'map_browser/map_list.html'
    ordering = ['-added_at']
    paginate_by = 9

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(MapListView, self).get_context_data(**kwargs)
        title = self.request.GET.get('title')
        if title:
            context.update({'title': title})
        print(context)
        return context

    # dodaj szukanie po dokumentsach
    def get_queryset(self):
        qs = super().get_queryset()
        title = self.request.GET.get('title')
        if title:
            res = qs.filter(Q(full_title__icontains=title))
            return res
        else:
            return qs


class DocumentListView(ListView, MultipleObjectMixin):
    model = Document
    template_name = 'map_browser/document_list.html'
    ordering = ['-added_at']
    paginate_by = 6

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DocumentListView, self).get_context_data(**kwargs)
        title = self.request.GET.get('title')
        if title:
            context.update({'title': title})
        print(context)
        return context

    # dodaj szukanie po dokumentsach
    def get_queryset(self):
        qs = super().get_queryset()
        title = self.request.GET.get('title')
        if title:
            res = qs.filter(Q(title__icontains=title))
            return res
        else:
            return qs


class MapDetailView(LoginRequiredMixin, DetailView):
    model = Map


class DocumentDetailView(DetailView, MultipleObjectMixin):
    model = Document
    paginate_by = 5

    def get_context_data(self, **kwargs):
        object_list = Map.objects.filter(document=self.get_object())
        context = super(DocumentDetailView, self).get_context_data(object_list=object_list)
        print(context)
        return context


class FilterMapView(ListView):
    model = Map
    template_name = 'map_browser/wyszukaj.html'
    paginate_by = 6

    def get_context_data(self, **kwargs):
        obj_list = MapFilter(self.request.GET, queryset=self.get_queryset())
        context = super(FilterMapView, self).get_context_data(object_list=obj_list.qs.order_by('added_at'))
        context['filter'] = obj_list
        return context


def contact(request):
    return render(request, 'map_browser/kontakt.html', {})


def default_redirect(request):
    return redirect('przegladaj-mapy')


def _get_form(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    return form_class(data, prefix=prefix)


def _get_form_with_file(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    file = request.FILES if prefix in request.POST else None
    return form_class(data, file, prefix=prefix)


class EditMapForm(LoginRequiredMixin, UpdateView):
    model = Map
    fields = ('full_title', 'description', 'filename', 'keyword_geo', 'keyword_name', 'keyword_subject', 'scale',
              'subject', 'source_text', 'creation_type',)
    template_name_suffix = '_edit'

    def get_success_url(self):
        return reverse('map-detail', kwargs={'pk': self.object.pk})


class DeleteMapView(LoginRequiredMixin, DeleteView):
    model = Map
    success_url = reverse_lazy('przegladaj-mapy')


class AddMapForm(LoginRequiredMixin, CreateView):
    template_name = 'map_browser/dodaj_mape.html'

    def get(self, request, *args, **kwargs):
        return self.render_to_response({'map_form': MapForm(prefix='map_form'),
                                        'people_form': PeopleForm(prefix='people_form'),
                                        'archive_form': ArchiveForm(prefix='archive_form')})

    def post(self, request, *args, **kwargs):
        map_form = _get_form_with_file(request, MapForm, 'map_form')
        people_form = _get_form(request, PeopleForm, 'people_form')
        archive_form = _get_form(request, ArchiveForm, 'archive_form')

        if map_form.is_bound and map_form.is_valid():
            obj = map_form.save()
            messages.success(request, 'Mapa została dodana')
            # on success redirect to the detail page of newly created object
            return redirect(reverse('map-detail', kwargs={'pk': obj.pk}))

        if people_form.is_bound and people_form.is_valid():
            values = people_form.cleaned_data
            obj, created = People.objects.get_or_create(
                first_name=values['first_name'],
                last_name=values['last_name']
            )
            messages.success(request, f'Autor {obj.first_name} {obj.last_name} został dodany')

        if archive_form.is_bound and archive_form.is_valid():
            values = archive_form.cleaned_data
            obj, created = Archive.objects.get_or_create(
                archive_name=values['archive_name'],
                archive_team=values['archive_team'],
                archive_unit=values['archive_unit'],
                archive_number=values['archive_number']
            )
            messages.success(request, 'Archiwum zostało dodane')

        print("is bound: " + str(map_form.is_bound) + 'is valid: ' + str(map_form.is_valid()) + 'fields' +
              str(map_form.fields))

        map_form = MapForm(request.POST)

        return render(request, 'map_browser/dodaj_mape.html',
                      {'map_form': map_form, 'people_form': people_form, 'archive_form': archive_form})


def add_map_form(request):
    MapFormset = modelformset_factory(Map, form=MapForm, extra=0)
