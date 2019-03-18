from django.shortcuts import render


def index(request):
    return render(request, 'baseApp/dashboard.html')


def auth(request):
    return render(request, 'baseApp/authorization.html')


def acc(request):
    return render(request, 'baseApp/account.html')

def registration(request):
	return render(request, 'baseApp/registration.html')