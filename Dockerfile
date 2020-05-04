FROM debian:buster

workdir /opt/quake2

add ./quake2.zip /opt/quake2.zip

run useradd -m -s /bin/bash quake2 \
    && chown -R quake2:quake2 /opt/quake2

# Build files for Quake II Pro.
run apt-get update && apt-get install -y build-essential libsdl2-dev libopenal-dev \
    libpng-dev libjpeg-dev zlib1g-dev mesa-common-dev \
    libcurl4-gnutls-dev wget unzip

# Unzip our copy of Quake II into the system.
run chmod +x /opt/quake2.zip \
    && unzip /opt/quake2.zip -d /opt/quake2

# Compile Quake II Pro server for our architecture.
run mkdir /opt/build && wget https://skuller.net/q2pro/nightly/q2pro-source.tar.gz -O- | tar zxvf - -C /opt/build
run mv /opt/build/q2pro-r*/* /opt/build/
run (cd /opt/build && make && make strip)
run mv /opt/build/q2proded /opt/quake2/

expose 27910

user quake2

#cmd sleep infinity
cmd ./q2proded +exec server.cfg +set dedicated 1 +set deathmatch 1
