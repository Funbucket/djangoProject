FROM python:3.9.7

ENV PYTHONBUFFERED 1

RUN apt-get -y update

RUN mkdir /srv/djangoProject

WORKDIR /srv/djangoProject

ADD ./ ./

RUN pip install --upgrade pip

RUN pip install -r requirements.txt
