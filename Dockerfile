#docker run -it --rm --cap-add=NET_ADMIN debian:stretch-slim bash
FROM debian:stretch-slim


RUN echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list && \
    printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable && \
    apt update && apt install -y wireguard iproute2 && \
    mkdir /wireguard

CMD wireguard-go -f wg0