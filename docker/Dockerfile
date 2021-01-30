FROM alpine:latest

COPY bind9 /usr/local/src/bind9
COPY build.sh /usr/local/bin/
RUN /usr/local/bin/build.sh

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 53/udp
EXPOSE 53/tcp

CMD [ "/usr/local/bin/docker-entrypoint.sh"]

