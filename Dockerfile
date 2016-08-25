# docker-metronome
#
# VERSION 0.1

FROM ubuntu:trusty
MAINTAINER Gints Polis <polis.gints@gmail.com>

# Image maintenance
sudo apt-get update

# Development tools
RUN apt-get install -y build-essential
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y git

# Metronome compile
RUN mkdir /metronome
RUN git clone https://github.com/ahupowerdns/metronome.git /metronome
RUN cd /metronome
RUN ./bootstrap
RUN ./configure
RUN make

# Prepeare run enviroment
RUN mkdir /stats

EXPOSE 8000

CMD /metronome/metronome --stats-directory=/stats