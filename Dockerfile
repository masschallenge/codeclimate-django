FROM ubuntu
 
RUN apt-get update

RUN apt-get install -y wget build-essential python python-dev python-pip python-virtualenv

MAINTAINER masschallenge dev team <dev@masschallenge.org>

WORKDIR /code

RUN pip install pep8 pylint pylint-django django_linter flake8 simplejson prospector[with_everything]

RUN useradd -u 9000 -r -s /bin/false app

USER app

COPY . /usr/src/app

VOLUME /code

CMD ["/usr/src/app/bin/codeclimate-prospector"]