import requests
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import RegisterUserFrom
from django.contrib.auth import views as auth_views
from django.contrib.auth.mixins import LoginRequiredMixin
# Create your views here.


def register(request):
    if request.user.is_anonymous:
        if request.method == 'POST':
            form = RegisterUserFrom(request.POST)
            if form.is_valid():
                form.save()
                username = form.cleaned_data.get('username')
                messages.success(request, f"Utworzono konto dla {username}")
                return redirect('login')
        else:
            form = RegisterUserFrom()
        return render(request, 'users/register.html', {'form': form})
    else:
        return redirect('przegladaj')


class LogoutViewMy(LoginRequiredMixin, auth_views.LogoutView):
    login_url = 'login'



