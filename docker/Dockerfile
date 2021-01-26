FROM alpine:latest

COPY bind9 /usr/local/src/
COPY build.sh /usr/local/bin
RUN /usr/local/bin/build.sh

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]

