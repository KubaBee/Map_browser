import datetime
from django.shortcuts import render, redirect, reverse
from django.views.generic import CreateView, UpdateView, DeleteView
from .forms import MapForm, PeopleForm, ArchiveForm, DocumentForm
from .models import Map, Archive, People, Document
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.views.generic.list import ListView, MultipleObjectMixin
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.urls import reverse_lazy
from django.db.models import Q
from .filters import MapFilter, DocumentFilter
from django.http import HttpResponse, HttpResponseServerError
import csv


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
        return context

    # dodaj szukanie po mapach
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

    def get_context_data(self, **kwargs):

        context = super(MapDetailView, self).get_context_data(**kwargs)

        if Map.objects.filter(id__gt=self.get_object().id).first() is not None:
            context['next_map'] = Map.objects.filter(
                id__gt=self.get_object().id
            ).first()
        if Map.objects.filter(id__lt=self.get_object().id).first() is not None:
            context['prev_map'] = Map.objects.filter(id__lt=self.get_object().id).last()

        return context


class DocumentDetailView(LoginRequiredMixin, DetailView, MultipleObjectMixin):
    model = Document
    paginate_by = 5

    def get_context_data(self, **kwargs):
        object_list = Map.objects.filter(document=self.get_object())
        context = super(DocumentDetailView, self).get_context_data(
            object_list=object_list
        )

        if Document.objects.filter(id__gt=self.get_object().id).first() is not None:
            context['next_doc'] = Document.objects.filter(
                id__gt=self.get_object().id
            ).first()
        if Document.objects.filter(id__lt=self.get_object().id).first() is not None:
            context['prev_doc'] = Document.objects.filter(
                id__lt=self.get_object().id
            ).last()
        return context


class FilterMapView(ListView):
    model = Map
    template_name = 'map_browser/map-search.html'
    paginate_by = 6

    def get_context_data(self, **kwargs):
        obj_list = MapFilter(self.request.GET, queryset=self.get_queryset())
        context = super(FilterMapView, self).get_context_data(
            object_list=obj_list.qs.order_by('added_at')
        )
        context['filter'] = obj_list
        return context


class FilterDocumentView(ListView):
    model = Document
    template_name = 'map_browser/document-search.html'
    paginate_by = 6

    def get_context_data(self, **kwargs):
        obj_list = DocumentFilter(self.request.GET, queryset=self.get_queryset())
        context = super(FilterDocumentView, self).get_context_data(
            object_list=obj_list.qs.order_by('added_at')
        )
        context['filter'] = obj_list

        return context


def contact(request):
    return render(request, 'map_browser/kontakt.html', {})


def default_redirect(request):
    return redirect('przegladaj-mapy')


def _get_form(request, form_class, prefix: str):
    data = request.POST if prefix in request.POST else None
    return form_class(data, prefix=prefix)


def _get_form_with_file(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    file = request.FILES if prefix in request.POST else None
    return form_class(data, file, prefix=prefix)


class EditMapForm(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Map
    form_class = MapForm
    template_name_suffix = '_edit'

    def test_func(self):
        return (
            self.get_object().creator == self.request.user
            or self.request.user.is_superuser
        )

    def get_success_url(self):
        return reverse('szczegoly-mapy', kwargs={'pk': self.object.pk})


class DeleteMapView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Map
    success_url = reverse_lazy('przegladaj-mapy')

    def test_func(self):
        return (
            self.get_object().creator == self.request.user
            or self.request.user.is_superuser
        )


class EditDocumentForm(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Document
    form_class = DocumentForm
    template_name_suffix = '_edit'

    def test_func(self):
        return (
            self.get_object().creator == self.request.user
            or self.request.user.is_superuser
        )

    def get_success_url(self):
        return reverse('szczegoly-dokumenty', kwargs={'pk': self.object.pk})


class DeleteDocumentView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Document
    success_url = reverse_lazy('przegladaj-dokumenty')

    def test_func(self):
        return (
            self.get_object().creator == self.request.user
            or self.request.user.is_superuser
        )


class AddMapForm(LoginRequiredMixin, CreateView):
    template_name = 'map_browser/dodaj_mape.html'

    def get(self, request, *args, **kwargs):
        return self.render_to_response(
            {
                'map_form': MapForm(prefix='map_form'),
                'people_form': PeopleForm(prefix='people_form'),
                'archive_form': ArchiveForm(prefix='archive_form'),
            }
        )

    def post(self, request, *args, **kwargs):
        map_form = _get_form_with_file(request, MapForm, 'map_form')
        people_form = _get_form(request, PeopleForm, 'people_form')
        archive_form = _get_form(request, ArchiveForm, 'archive_form')

        if people_form.is_bound and people_form.is_valid():
            values = people_form.cleaned_data
            obj, created = People.objects.get_or_create(
                first_name=values['first_name'], last_name=values['last_name']
            )
            if not created:
                return HttpResponseServerError()

        if archive_form.is_bound and archive_form.is_valid():
            values = archive_form.cleaned_data
            obj, created = Archive.objects.get_or_create(
                archive_name=values['archive_name'],
                archive_team=values['archive_team'],
                archive_unit=values['archive_unit'],
                archive_number=values['archive_number'],
            )
            if not created:
                return HttpResponseServerError()

        if map_form.is_bound and map_form.is_valid():
            obj = map_form.save()
            messages.success(request, 'Mapa została dodana')
            # on success redirect to the detail page of newly created object
            return redirect(reverse('szczegoly-mapy', kwargs={'pk': obj.pk}))

        messages.warning(request, 'Mapa nie została dodana')

        return render(
            request,
            'map_browser/dodaj_mape.html',
            {
                'map_form': map_form,
                'people_form': people_form,
                'archive_form': archive_form,
            },
        )


class AddDocumentForm(LoginRequiredMixin, CreateView):
    template_name = 'map_browser/dodaj_dokument.html'

    def get(self, request, *args, **kwargs):
        return self.render_to_response(
            {
                'doc_form': DocumentForm(prefix='doc_form'),
                'people_form': PeopleForm(prefix='people_form'),
                'archive_form': ArchiveForm(prefix='archive_form'),
            }
        )

    def post(self, request, *args, **kwargs):
        doc_form = _get_form_with_file(request, DocumentForm, 'doc_form')
        people_form = _get_form(request, PeopleForm, 'people_form')
        archive_form = _get_form(request, ArchiveForm, 'archive_form')

        if people_form.is_bound and people_form.is_valid():
            values = people_form.cleaned_data
            obj, created = People.objects.get_or_create(
                first_name=values['first_name'], last_name=values['last_name']
            )

            if not created:
                return HttpResponseServerError()

        if archive_form.is_bound and archive_form.is_valid():
            values = archive_form.cleaned_data
            obj, created = Archive.objects.get_or_create(
                archive_name=values['archive_name'],
                archive_team=values['archive_team'],
                archive_unit=values['archive_unit'],
                archive_number=values['archive_number'],
            )
            if not created:
                return HttpResponseServerError()

        if doc_form.is_bound and doc_form.is_valid():
            obj = doc_form.save()
            messages.success(request, 'Dokument został dodany')
            # on success redirect to the detail page of newly created object
            return redirect(reverse('szczegoly-dokumenty', kwargs={'pk': obj.pk}))

        messages.warning(request, 'Dokument nie został dodany')

        return render(
            request,
            'map_browser/dodaj_dokument.html',
            {
                'doc_form': doc_form,
                'people_form': people_form,
                'archive_form': archive_form,
            },
        )


@login_required
def map_csv_export(request):
    all_maps = Map.objects.all()

    response = HttpResponse('text/csv')
    response[
        'Content-Disposition'
    ] = f'attachment; filename="Raport Map_{datetime.datetime.now()}.csv"'

    writer = csv.writer(response)
    writer.writerow(
        [
            'Sygnatura Czasowa',
            'Tytuł Pełny',
            'Tytuł Krótki',
            'Osoba Dodająca',
            'Miejsce Wydania',
            'Link do mapy',
            'Autorzy',
        ]
    )

    for single_map in all_maps:
        writer.writerow(
            [
                single_map.added_at,
                single_map.full_title,
                single_map.short_title,
                single_map.creator,
                single_map.publication_place,
                single_map.filename.url,
                [
                    author if author is not None else " "
                    for author in single_map.authors.all()
                ],
            ]
        )
    return response


@login_required
def doc_csv_export(request):
    all_docs = Document.objects.all()

    response = HttpResponse('text/csv')
    response[
        'Content-Disposition'
    ] = f'attachment; filename="Raport Dokumentów_{datetime.datetime.now()}.csv"'

    writer = csv.writer(response)
    writer.writerow(
        [
            'Sygnatura Czasowa',
            'Tytuł',
            'Osoba Dodająca',
            'Link do dokumentu',
            'Link do tłumacznenia',
            'Autorzy',
        ]
    )

    for single_doc in all_docs:
        writer.writerow(
            [
                single_doc.added_at,
                single_doc.title,
                single_doc.creator,
                single_doc.doc_file.url,
                single_doc.translation_file.url,
                [
                    author if author is not None else " "
                    for author in single_doc.authors.all()
                ],
            ]
        )
    return response


def custom_page_not_found_view(request, exception=None):
    return render(request, "map_browser/404.html")


def custom_error_view(request, exception=None):
    return render(request, "map_browser/500.html")


def custom_forbidden_view(request, exception=None):
    return render(request, "map_browser/403.html")


# def navigate_through_detail(objects, current_id):
#
#     context = {}
#
#     if objects.filter(id__gt=current_id).first() is not None:
#         next_map = Map.objects.filter(id__gt=current_id).first()
#         context['next_map'] = next_map
#     if objects.filter(id__lt=current_id).last() is not None:
#         prev_map = Map.objects.filter(id__lt=current_id).last()
#         context['prev_map'] = prev_map
#
#     return context
