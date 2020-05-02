FROM debian:buster

# Derived from https://github.com/InAnimaTe/docker-quake2.

## The Data from the official point release.
RUN echo "deb http://httpredir.debian.org/debian buster contrib" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y unzip quake2-server \
	wget && \
	apt-get clean

RUN rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*

WORKDIR /usr/share/games/quake2

ADD quake2.zip /usr/share/games/quake2/quake2.zip

RUN chmod +x quake2.zip && \
    unzip quake2.zip && \
    rm -rf quake2.zip

USER quake2-server

EXPOSE 27910/udp

ENTRYPOINT ["/usr/games/quake2-server"]

CMD ["+map", "q2dm1", "+exec", "server.cfg"]
