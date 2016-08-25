# docker-pdns
#
# VERSION 0.1

FROM centos:7
MAINTAINER Gints Polis <polis.gints@gmail.com>

# Development tools
RUN yum -y groupinstall "Development Tools"
RUN yum -y install eigen3-devel
RUN yum -y install git

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