import os

from django.shortcuts import render, redirect
from django.views.generic import CreateView
from .forms import MapForm, PeopleForm, ArchiveForm
from .models import Map, Archive, People
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.contrib import messages

class MapListView(ListView):
    model = Map
    paginate_by = 9
    ordering = ['-added_at']

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     return context


class MapDetailView(DetailView):
    model = Map

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     return context


def search(request):
    return render(request, 'map_browser/wyszukaj.html')


def contact(request):
    return render(request, 'map_browser/kontakt.html', {})


def _get_form(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    return form_class(data, prefix=prefix)


def _get_form_with_file(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    file = request.FILES if prefix in request.POST else None
    return form_class(data, file, prefix=prefix)


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
            map_form.save()
            messages.success(request, 'Mapa została dodana')

        if people_form.is_bound and people_form.is_valid():
            values = people_form.cleaned_data
            obj, created = People.objects.get_or_create(
                first_name=values['first_name'],
                last_name=values['last_name']
            )
            messages.success(request, 'Autor został dodany')

            print(obj, created)

        if archive_form.is_bound and archive_form.is_valid():
            values = archive_form.cleaned_data
            obj, created = Archive.objects.get_or_create(
                    archive_name=values['archive_name'],
                    archive_team=values['archive_team'],
                    archive_unit=values['archive_unit'],
                    archive_number=values['archive_number']
                )
            messages.success(request, 'Archiwum zostało dodane')

            print(obj, created)

        return render(request, 'map_browser/dodaj_mape.html',
                      {'people_form': people_form, 'map_form': map_form, 'archive_form': archive_form})
