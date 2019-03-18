#!/bin/bash
set -x

set -e


if [[ "X$DJANGO_RUN_MIGRATIONS" = 'Xyes' ]]; then
    echo "running migrations"
    python manage.py migrate --noinput
fi

#if [[ "X$DJANGO_RUN_COLLECTSTATIC" = 'Xyes' ]]; then
#    echo "collecting static files"
#    python manage.py collectstatic --noinput
#fi

if [[ "X$DJANGO_RUN_CREATESUPERUSER" = 'Xyes' ]]; then
    echo "creating a superuser"
    if [[ -z ${ADMIN_USERNAME+x} ]]; then
        echo "Please set the ADMIN_USERNAME env variable";
        exit 1
    fi

    if [[ -z ${ADMIN_PASSWORD+x} ]]; then
        echo "Please set the ADMIN_PASSWORD env variable";
        exit 1
    fi
    ADMIN_EMAIL=admin@example.com
    python manage.py shell -c "from django.contrib.auth.models import User;\
      User.objects.filter(email='$ADMIN_EMAIL').delete();\
      User.objects.create_superuser('$ADMIN_USERNAME', '$ADMIN_EMAIL', '$ADMIN_PASSWORD')"
fi
exec "$@"
