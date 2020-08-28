FROM alpine:latest
MAINTAINER Nicolas Lorin <androw95220@gmail.com>

RUN mkdir -p /usr/local/etc/unbound/
RUN apk add --update --no-cache unbound=1.10.1-r0 curl ca-certificates && curl -o /usr/local/etc/unbound/root.hints https://www.internic.net/domain/named.cache
RUN unbound-anchor -a /usr/local/etc/unbound/root.key ; true
RUN chown -R unbound:unbound /usr/local/etc/unbound/

EXPOSE 53
EXPOSE 53/udp

CMD ["/bin/sh"]
CMD ["/usr/sbin/unbound", "-d", "-v"]
