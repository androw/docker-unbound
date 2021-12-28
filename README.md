# docker-unbound
docker-unbound is a docker image based on Alpine for the validating, recursive, caching DNS resolver Unbound

# usage
Create a DNS server and publish it

`docker run -p 53:53/tcp -p 53:53/udp -v example.conf:/etc/unbound/unbound.conf androw/unbound`

example.conf is available in the repository
Config file should be following https://unbound.docs.nlnetlabs.nl/en/latest/
