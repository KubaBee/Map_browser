from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, User, AuthenticationForm, UsernameField
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Submit, Div, Fieldset, HTML
from crispy_bootstrap5.bootstrap5 import FloatingField


class RegisterUserFrom(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(required=False)
    last_name = forms.CharField(required=False)

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2', 'first_name', 'last_name']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.fields['username'].help_text = None
        self.fields['username'].label = "Username*"
        self.fields['email'].label = "Email*"
        self.fields['password1'].label = "Password*"
        self.fields['password1'].help_text = None
        self.fields['password2'].label = "Confirm Password*"
        self.helper.layout = Layout(
            Div(
                Div(FloatingField('username', 'email', 'password1', 'password2', HTML("""<p>Masz już konto? 
            <a href="{% url 'login' %}">Zaloguj się!</a></p>""")), css_class='col-md-6', ),
                Div(FloatingField('first_name', 'last_name'), css_class='col-md-6'),
                css_class='row',
            ),
            Submit('submit', 'Submit'),
        )


class LoginUserForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.layout = Layout(
            Fieldset('Zaloguj się!', FloatingField('username', 'password', HTML("""<p>Nie masz jeszcze konta? 
            <a href="{% url 'register' %}">Załóż je!</a></p>"""))),
            # Submit('submit', 'Zaloguj się')
        )