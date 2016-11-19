FROM resin/rpi-raspbian:latest
MAINTAINER Geethree

ENV NAME RaspPlay

COPY raspiplay.sh /usr/bin/

RUN cd /tmp && \
    apt-get update && \
    apt-get install -y avahi-utils build-essential git libasound2-dev libavahi-client-dev libssl-dev && \
    apt-get clean && \
    git clone https://github.com/abrasive/shairport.git shairport && \
    cd shairport && \
    ./configure && \
    make && make install 

ENTRYPOINT ["raspiplay.sh"]