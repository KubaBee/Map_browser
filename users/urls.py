from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from .forms import LoginUserForm


urlpatterns = [
    path(
        'login/',
        auth_views.LoginView.as_view(
            template_name='users/login.html',
            authentication_form=LoginUserForm,
            redirect_authenticated_user=True,
        ),
        name='login',
    ),
    path(
        'logout/',
        views.LogoutViewMy.as_view(template_name='users/logout.html'),
        name='logout',
    ),
    path('register/', views.register, name='register'),
    path('activate/<uidb64>/<token>/', views.activate_account, name='activate')
    # path('password-reset/', views.reset_pwd, name='pwd_reset'),
]
