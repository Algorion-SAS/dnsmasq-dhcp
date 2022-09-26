FROM arm32v7/alpine

MAINTAINER Cyrius cyril@algorion.fr

RUN apk --update add --no-cache \
    bash \
    supervisor \
    dnsmasq

COPY src/ /data/

RUN chmod +x /data/entry.sh

ENTRYPOINT /data/entry.sh 
