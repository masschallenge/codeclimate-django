FROM masschallenge/python:v1.0.2

MAINTAINER masschallenge dev team <dev@masschallenge.org>

RUN apk add py-pip py-numpy --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

WORKDIR /usr/src/app

RUN pip install pep8 pylint pylint-django django_linter flake8 simplejson prospector[with_everything]

RUN adduser -S -s /bin/false -u 9000 -D app

USER app

COPY . /usr/src/app

VOLUME /code

WORKDIR /code

CMD ["/usr/src/app/bin/codeclimate-prospector"]