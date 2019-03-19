from django.shortcuts import render


def index(request):
    p1 = {"name": "name1",
          "time_spent": "1",
          "descr": "awesome project"}
    p2 = {"name": "name2",
          "time_spent": "2",
          "descr": "great project"}
    projects = [p1, p2]
    context = {
        "projects": projects
    }

    return render(request, 'baseApp/project.html', context=context)


def auth(request):
    return render(request, 'baseApp/authorization.html')


def acc(request):
    return render(request, 'baseApp/account.html')


def registration(request):
    return render(request, 'baseApp/registration.html')
