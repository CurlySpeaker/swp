FROM python:3.6

RUN mkdir /src/
RUN chmod 777 -R /src
WORKDIR /src/

ADD . /src/

EXPOSE 8000

ENV UWSGI_WSGI_FILE=swp/wsgi.py UWSGI_HTTP=:8000 \
UWSGI_MASTER=1 UWSGI_WORKERS=2 UWSGI_THREADS=8 UWSGI_UID=1000 UWSGI_GID=2000 \
UWSGI_LAZY_APPS=1 UWSGI_WSGI_ENV_BEHAVIOR=holy

RUN pip install --upgrade pip && pip install -r requirements.txt

# Start uWSGI
RUN chmod +x docker_config/entrypoint.sh

ENTRYPOINT ["docker_config/entrypoint.sh"]
CMD ["uwsgi", "--http-auto-chunked", "--http-keepalive"]
