FROM debian:latest

RUN apt-get update -qq \
    && apt-get install -qqy wget lsb-release \
    && echo deb http://packages.prosody.im/debian $(lsb_release -sc) main > /etc/apt/sources.list.d/prosody.list \
    && wget https://prosody.im/files/prosody-debian-packages.key -O- | apt-key add - \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y prosody-0.10 libssl1.0.0 lua-sec lua-event lua-zlib lua-socket liblua5.1-expat0 liblua5.1-filesystem0 \
    && rm -rf /var/lib/apt/lists/* \

USER prosody

ENTRYPOINT ["prosody"]
