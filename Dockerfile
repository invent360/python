FROM python:3-alpine

MAINTAINER T.N.N <katson95@nava.de> 

ARG BUILD_DATE

ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/nikos/python3-alpine-flask-docker"

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY /config/requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

EXPOSE 5000

CMD [ "python", "./app.py" ]
