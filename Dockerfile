FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get -y install --no-install-recommends atop zip psmisc imagemagick iproute2\ 
 && apt-get -y install --no-install-recommends iputils-ping iptables aptitude squid\
 && apt-get -y install --no-install-recommends mc traceroute vim wget apache2-utils lynx less telnet\
 && apt-get clean

# RUN pip install git+https://github.com/Blazemeter/taurus.git

COPY ./squid/* /etc/squid/
COPY ./init.sh /usr/bin/

RUN /etc/init.d/squid restart
ENTRYPOINT ["/bin/bash"]
