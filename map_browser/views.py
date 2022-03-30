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


class AddMapForm(LoginRequiredMixin, CreateView):
    model = Map
    form_class = MapForm
    template_name = 'map_browser/dodaj_mape.html'
    success_url = reverse_lazy('przegladaj')

    def get(self, request, *args, **kwargs):
        return self.render_to_response({'map_form': MapForm(prefix='map_form'),
                                        'people_form': PeopleForm(prefix='people_form')})

    def post(self, request, *args, **kwargs):
        map_form = _get_form(request, MapForm, 'map_form')
        people_form = _get_form(request, PeopleForm, 'people_form')
        if map_form.is_valid():
            map_form.save(commit=True)
            return redirect('przegladaj')
        elif people_form.is_valid():
            people_form.save(commit=True)
            return redirect('dodaj_mape')
        return redirect('przegladaj')

