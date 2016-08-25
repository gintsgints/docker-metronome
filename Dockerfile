# docker-metronome
#
# VERSION 0.1

FROM ubuntu:xenial
MAINTAINER Gints Polis <polis.gints@gmail.com>

# Image maintenance
RUN apt-get update

# Development tools
RUN apt-get install -y build-essential
RUN apt-get install -y dh-autoreconf
RUN apt-get install -y autoconf
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y git
RUN apt-get install -y nginx
RUN apt-get install -y supervisor

# Metronome compile
RUN git clone https://github.com/ahupowerdns/metronome.git /metronome
RUN cd /metronome \
    && ./bootstrap \
    && ./configure \
    && make

# Prepeare run enviroment
RUN mkdir /stats
ADD ./assets/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# nginx
COPY assets/nginx/nginx.conf /etc/nginx/nginx.conf
COPY assets/nginx/vhost.conf /etc/nginx/sites-enabled/vhost.conf
RUN rm /etc/nginx/sites-enabled/default

# web, nginx and carbon ports
EXPOSE 8000
ExPOSE 8001
EXPOSE 2003

CMD /usr/bin/supervisord