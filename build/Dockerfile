FROM arm32v7/alpine

MAINTAINER Cyrius cyril@algorion.fr

LABEL version="1.0"
LABEL description="DHCP server using netmasq"

RUN apk --update add --no-cache \
    bash \
    supervisor \
    dnsmasq

ENV UUID=1000
ENV GUID=1000
ENV DHCP_START_ADDRESS='192.168.0.101'
ENV DHCP_END_ADDRESS='192.168.0.200'
ENV DHCP_ADDRESS_MASK='255.255.255.0'
ENV DHCP_LEASE_TIME='24h'
ENV DHCP_ROUTER_ADDRESS='192.168.0.1'
ENV DHCP_DNS='1.1.1.2, 1.1.1.1'

VOLUME ["/data/conf"]

COPY src/ /data/

RUN chmod +x /data/entry.sh

ENTRYPOINT /data/entry.sh 
