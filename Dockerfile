FROM debian:jessie

RUN apt-get update && \
    apt-get install -y python-pip && \
    apt-get clean && \
        rm -rf /var/lib/apt/lists/* \
               /tmp/* \
               /var/tmp/*

COPY requirements.txt /srv/requirements.txt

RUN pip install -r /srv/requirements.txt

COPY __init__.py /srv/__init__.py
COPY manage.py /srv/manage.py
COPY static /srv/static
COPY templates /srv/templates
COPY project /srv/project

CMD ["python", "/srv/manage.py", "runserver", "0.0.0.0:80"]

EXPOSE 80
