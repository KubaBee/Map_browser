from django.shortcuts import render, redirect, reverse
from django.views.generic import CreateView
from .forms import MapForm, PeopleForm, ArchiveForm
from .models import Map, Archive, People
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.forms.models import modelformset_factory


class MapListView(ListView):
    model = Map
    paginate_by = 9
    ordering = ['-added_at']

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(MapListView, self).get_context_data(**kwargs)
        title = self.request.GET.get('title')
        if title:
            context.update({'title': title})
        return context

    def get_queryset(self):
        qs = super().get_queryset()
        title = self.request.GET.get('title')
        if title:
            return qs.filter(full_title__icontains=title)
        else:
            return qs


class MapDetailView(DetailView, LoginRequiredMixin):
    model = Map


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

        return render(request, 'map_browser/dodaj_mape.html',
                      {'people_form': people_form, 'map_form': map_form, 'archive_form': archive_form})


def add_map_form(request):
    MapFormset = modelformset_factory(Map, form=MapForm, extra=0)
