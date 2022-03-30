from django.shortcuts import render, redirect
from django.views.generic import CreateView
from django.http import HttpResponse, HttpResponseRedirect
from .forms import MapForm, PeopleForm
from .models import Map
from django.urls import reverse_lazy, reverse
from django.contrib.auth.mixins import LoginRequiredMixin
# Create your views here.


def browse(request):
    context = {
        "data": [1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
    return render(request, 'map_browser/przegladaj.html', context)


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
                                        'people_form': PeopleForm(prefix='people_form')})

    def post(self, request, *args, **kwargs):
        map_form = _get_form_with_file(request, MapForm, 'map_form')
        people_form = _get_form(request, PeopleForm, 'people_form')
        if map_form.is_bound and map_form.is_valid():
            print(map_form.cleaned_data)
            map_form.save()
        elif people_form.is_bound and people_form.is_valid():
            print(people_form.cleaned_data)
            people_form.save()
        return render(request, 'map_browser/dodaj_mape.html', {'people_form': people_form, 'map_form': map_form})
