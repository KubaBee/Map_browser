import requests
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import RegisterUserFrom
from django.contrib.auth import views as auth_views, login, logout, get_user_model, authenticate
from django.contrib.auth.mixins import LoginRequiredMixin
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.core.mail import EmailMessage
from .token import account_token


def register(request):
    if request.user.is_anonymous:
        if request.method == 'POST':
            form = RegisterUserFrom(request.POST)
            if form.is_valid():
                user = form.save(commit=False)
                user.is_active = False
                user.save()
                username = form.cleaned_data.get('username')
                # messages.success(request, f"Utworzono konto dla {username}")
                send_activate_account_email(request, user, form.cleaned_data.get('email'))
                return redirect('login')
        else:
            form = RegisterUserFrom()
        return render(request, 'users/register.html', {'form': form})
    else:
        return redirect('przegladaj-mapy')


def activate_account(request, uidb64, token):
    User = get_user_model()
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except:
        user = None
        messages.error(request, "Aktywacja nie powiodłą się, spróbuj ponownie")

    if user is not None and account_token.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, "Aktywacja powiodła się")

    return redirect('przegladaj-mapy')


def send_activate_account_email(request, user, email):
    mail_title = "Potwierdź swój adres e-mail"
    mail_body = render_to_string('users/activate_email_body.html', {
        'user': user,
        'domain': get_current_site(request).domain,
        'uid': urlsafe_base64_encode(force_bytes(user.pk)),
        'token': account_token.make_token(user=user),
        'protocol': 'https' if request.is_secure() else 'http'
    })
    email = EmailMessage(mail_title, mail_body, to=[email])
    if email.send():
        messages.success(request, f"Utworzono konto dla {user.username} oraz wysłano email weryfikacyjny na podany adres!")
    else:
        messages.error(request, f'Wystąpił błąd podczas wysyłania wiadomości email')


# dodaj wysyłąnie emaila po naciśnięciu przycisku -> przekieruj do strony i zmień hasło
# def reset_pwd(request):
#     User = get_user_model()
#     try:
#         uid = force_str(urlsafe_base64_decode(uidb64))
#         user = User.objects.get(pk=uid)
#     except:
#         user = None
#         messages.error(request, "Aktywacja nie powiodłą się, spróbuj ponownie")
#
#     if user is not None and account_token.check_token(user, token):
#         user.is_active = True
#         user.save()
#         messages.success(request, "Aktywacja powiodła się")
#
#     return redirect('przegladaj-mapy')
#
#
# def send_password_reset_email(request, user, email):
#     mail_title = "Zresetuj swoje hasło"
#     mail_body = render_to_string('users/reset_password_body.html', {
#         'user': user.username,
#         'domain': get_current_site(request).domain,
#         'uid': urlsafe_base64_encode(force_bytes(user.pk)),
#         'token': account_token.make_token(user=user),
#         'protocol': 'https' if request.is_secure() else 'http'
#     })
#
#     email = EmailMessage(mail_title, mail_body, to=[email])
#     if email.send():
#         messages.success(request, "Wysłano email do zmiany hasła. Jeśli nie widzisz go w głównej skrzynce, sprawdź też spam")
#     else:
#         messages.error(request, f'Wystąpił błąd podczas wysyłania wiadomości email')


class LogoutViewMy(LoginRequiredMixin, auth_views.LogoutView):
    login_url = 'login'




