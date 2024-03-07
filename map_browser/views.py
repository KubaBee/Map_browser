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
from django.http import HttpResponse, HttpResponseServerError
from .mixins import ActiveObjectFilterMixin, FilterViewMixin
from .filters import MapFilter, DocumentFilter
import csv


class MapListView(ActiveObjectFilterMixin, ListView, MultipleObjectMixin):
    model = Map
    template_name = 'map_browser/map_list.html'
    paginate_by = 9

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(MapListView, self).get_context_data(**kwargs)
        title = self.request.GET.get('title')
        if title:
            context.update({'title': title})
        return context

    def get_queryset(self):
        qs = super().get_queryset()
        return self.filter_queryset(qs)


class DocumentListView(ActiveObjectFilterMixin, ListView, MultipleObjectMixin):
    model = Document
    template_name = 'map_browser/document_list.html'
    paginate_by = 6

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(DocumentListView, self).get_context_data(**kwargs)
        title = self.request.GET.get('title')
        if title:
            context.update({'title': title})
        return context

    def get_queryset(self):
        qs = super().get_queryset()
        return self.filter_queryset(qs)


class MapDetailView(ActiveObjectFilterMixin, DetailView):
    model = Map

    def get_context_data(self, **kwargs):

        context = super(MapDetailView, self).get_context_data(**kwargs)
        current_map = self.get_object()

        # Get the related documents for the current map, filtering by is_active
        if self.request.user.is_authenticated:
            related_documents = Document.objects.filter(
                source_reference=current_map
            )
        else:
            related_documents = Document.objects.filter(
                source_reference=current_map,
                is_active=True
            )

        context['related_documents'] = related_documents

        # affected by the new ordering
        context['next_object'], context['prev_object'] = get_next_and_prev_objects(
            self.get_object(), self.get_queryset())

        return context


class DocumentDetailView(ActiveObjectFilterMixin, DetailView, MultipleObjectMixin):
    model = Document
    paginate_by = 5

    def get_context_data(self, **kwargs):
        if self.request.user.is_authenticated:
            object_list = Map.objects.filter(document=self.get_object())
        else:
            object_list = Map.objects.filter(document=self.get_object(), is_active=True)

        context = super(DocumentDetailView, self).get_context_data(
            object_list=object_list
        )
        context['next_object'], context['prev_object'] = get_next_and_prev_objects(
            self.get_object(), self.get_queryset())

        return context


def get_next_and_prev_objects(current_object, queryset):

    current_index = list(queryset).index(current_object)

    next_index = current_index + 1
    next_object = queryset[next_index] if next_index < len(queryset) else None

    # Get the previous object
    previous_index = current_index - 1
    previous_object = queryset[previous_index] if previous_index >= 0 else None

    return next_object, previous_object


class FilterMapView(ActiveObjectFilterMixin, FilterViewMixin, ListView):
    model = Map
    template_name = 'map_browser/map-search.html'
    filter_class = MapFilter


class FilterDocumentView(ActiveObjectFilterMixin, FilterViewMixin, ListView):
    model = Document
    template_name = 'map_browser/document-search.html'
    filter_class = DocumentFilter


def default_redirect(request):
    return redirect('przegladaj-mapy')


def _get_form(request, form_class, prefix: str):
    data = request.POST if prefix in request.POST else None
    return form_class(data, prefix=prefix)


def _get_form_with_file(request, form_class, prefix):
    data = request.POST if prefix in request.POST else None
    file = request.FILES if prefix in request.POST else None
    return form_class(data, file, prefix=prefix)


class EditMapView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
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

    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        form.fields['related_docs'].queryset = Document.objects.all()
        return form

    def form_valid(self, form):
        related_docs = list(form.cleaned_data['related_docs'].values_list('pk', flat=True))
        self.object.document_set.clear()
        for single_id in related_docs:
            self.object.document_set.add(single_id)
        return super(EditMapView, self).form_valid(form)


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
            related_docs = list(map_form.cleaned_data['related_docs'].values_list('pk', flat=True))
            obj = map_form.save()
            for single_id in related_docs:
                obj.document_set.add(single_id)
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


def check_url_existence(self, request):

    if self and hasattr(self, 'url'):
        return request.build_absolute_uri(self.url)
    else:
        return "Brak zedfiniowanego linku dla tego obiektu"


@login_required
def map_csv_export(request):
    all_maps = Map.objects.all()

    response = HttpResponse()
    response[
        'Content-Disposition'
    ] = f'attachment; filename="Raport Map_{datetime.datetime.now()}.csv"'

    writer = csv.writer(response)
    writer.writerow(
        [
            'id',
            'Sygnatura Czasowa',
            'Tytuł Pełny',
            'Tytuł Krótki',
            'Autor Mapy',
            'Miejsce Wydania',
            'Link do Mapy (plik .jpg)',
            'Link do Mapy (w aplikacji)',
            'Opis'
        ]
    )

    for single_map in all_maps:
        authors = ", ".join(
            [f"{author.last_name} {author.first_name}" if author else " " for author in single_map.authors.all()])
        detail_url = request.build_absolute_uri(reverse('szczegoly-mapy', args=[single_map.pk]))
        writer.writerow(
            [
                single_map.id,
                single_map.added_at.strftime("%d-%m-%Y"),
                single_map.full_title,
                single_map.short_title,
                authors,
                single_map.publication_place,
                check_url_existence(single_map.filename, request),
                detail_url,
                single_map.description
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
            'id',
            'Sygnatura Czasowa',
            'Tytuł',
            'Autor Dokumentu',
            'Link do dokumentu',
            'Link do tłumaczenia',
            'Link do Dokumentu (w aplikacji)'
        ]
    )

    for single_doc in all_docs:
        # creators = ", ".join([user.username for user in single_doc.creator.all()])
        authors = ", ".join(
            [f"{author.last_name} {author.first_name}" if author else " " for author in single_doc.authors.all()])
        detail_url = request.build_absolute_uri(reverse('szczegoly-dokumenty', args=[single_doc.pk]))

        writer.writerow(
            [
                single_doc.id,
                single_doc.added_at.strftime("%d-%m-%Y"),
                single_doc.title,
                authors,
                check_url_existence(single_doc.doc_file, request),
                check_url_existence(single_doc.translation_file, request),
                detail_url
            ]
        )
    return response


def custom_page_not_found_view(request, exception=None):
    return render(request, "map_browser/404.html")


def custom_error_view(request, exception=None):
    return render(request, "map_browser/500.html")


def custom_forbidden_view(request, exception=None):
    return render(request, "map_browser/403.html")
