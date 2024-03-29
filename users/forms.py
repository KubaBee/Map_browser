from django import forms
from django.contrib.auth.forms import (
    UserCreationForm,
    User,
    AuthenticationForm,
)
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Submit, Div, Fieldset, HTML
from crispy_bootstrap5.bootstrap5 import FloatingField


class RegisterUserFrom(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(required=False)
    last_name = forms.CharField(required=False)

    class Meta:
        model = User
        fields = [
            'username',
            'email',
            'password1',
            'password2',
            'first_name',
            'last_name',
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.fields['username'].help_text = None
        self.fields['username'].label = "Nazwa użytkownika*"
        self.fields['email'].label = "Email*"
        self.fields['password1'].label = "Hasło*"
        self.fields['password1'].help_text = None
        self.fields['password2'].label = "Potwierdź hasło*"
        self.fields['password2'].help_text = "Wprowadź to samo hasło co poprzednio, w celu weryfikacji."
        self.fields['first_name'].label = 'Imię'
        self.fields['last_name'].label = 'Nazwisko'
        self.helper.layout = Layout(
            Div(
                Div(
                    FloatingField(
                        'username',
                        'email',
                        'password1',
                        'password2',
                        HTML(
                            """<p>Masz już konto? 
            <a href="{% url 'login' %}">Zaloguj się!</a></p>"""
                        ),
                    ),
                    css_class='col-md-6',
                ),
                Div(FloatingField('first_name', 'last_name'), css_class='col-md-6'),
                css_class='row',
            ),
            Submit('submit', 'Zarejestruj się'),
        )


class LoginUserForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
            Fieldset(
                'Zaloguj się!',
                FloatingField(
                    'username',
                    'password',
            #         HTML(
            #             """<p>Nie masz jeszcze konta?
            # <a href="{% url 'register' %}">Załóż je!</a></p>"""
            #         ),
                ),
            ),
            # Submit('submit', 'Zaloguj się')
        )
