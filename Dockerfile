FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends apt-utils

RUN apt-get -y install --no-install-recommends atop zip psmisc imagemagick iproute2\ 
 && apt-get -y install --no-install-recommends iputils-ping iptables aptitude squid\
 && apt-get -y install --no-install-recommends screen build-essential default-jdk git\
 && apt-get -y install --no-install-recommends mc traceroute vim wget apache2-utils nano\
 && apt-get -y install --no-install-recommends net-tools lynx less telnet python-pip python-dev\
 && apt-get clean

RUN pip install pip setuptools wheel

# template for branch install
RUN pip install git+https://github.com/Blazemeter/taurus@master

# copy configs
COPY ./squid/* /etc/squid/
COPY ./scripts/* /usr/local/bin/
COPY ./init.sh /usr/bin/

ENTRYPOINT  init.sh && /bin/bash
