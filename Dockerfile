FROM alpine:3.8
MAINTAINER Michał 'rysiek' Woźniak <rysiek@occrp.org>

RUN apk add offlineimap ca-certificates && \
      addgroup -g 1000 user && \
      adduser -D -h /home/user -G user -u 1000 user

USER user
ENV HOME /home/user
VOLUME ["/Configs", "/Secrets", "/Mail"]

ENTRYPOINT ["offlineimap", "-c", "/Configs/offlineimaprc"]
