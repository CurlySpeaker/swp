from django.urls import path, include
from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path('authorization/', views.auth, name='auth'),
    path('account/', views.acc, name='acc'),
    path('registration/', views.registration, name='registration'),
]
