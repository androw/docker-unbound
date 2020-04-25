FROM alpine:latest
MAINTAINER Nicolas Lorin <androw95220@gmail.com>

RUN apk add --update --no-cache unbound=1.9.6-r0 curl ca-certificates && curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache
RUN unbound-anchor -a /etc/unbound/root.key ; true

EXPOSE 53
EXPOSE 53/udp

CMD ["/bin/sh"]
CMD ["/usr/sbin/unbound", "-d", "-v"]
