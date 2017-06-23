FROM ubuntu:16.04

LABEL maintainer "Florian Kinder <florian.kinder@fankserver.com>"

COPY ./prosody.cfg.lua.patch /usr/src/prosody.cfg.lua.patch

RUN apt-get update -qq \
	&& apt-get install mercurial -yqqq \
	&& hg clone https://hg.prosody.im/trunk /usr/src/prosody \
	&& hg clone https://hg.prosody.im/prosody-modules /usr/src/prosody_modules \

	&& apt-get install lua5.1 luarocks libexpat1-dev libssl-dev bsdmainutils git libidn11-dev libevent1-dev libmysqlclient-dev libpq-dev libsqlite3-dev -yqqq \
	&& luarocks install luasec \
	&& luarocks install luaevent \
	&& luarocks install luaexpat \
	&& luarocks install luasocket \
	&& luarocks install luafilesystem \
	&& luarocks install luabitop \
	&& luarocks install lua-zlib \

	&& cd /tmp \
	&& git clone https://github.com/mwild1/luadbi.git \
	&& cd luadbi \
	&& make free \
	&& cp ./*.lua ./*.so /usr/lib/x86_64-linux-gnu/lua/5.1/ \
	&& cd .. \
	&& rm luadbi -rf \

	&& cd /usr/src/prosody \
	&& ./configure --prefix=/ \
	&& make \
	&& make install \
	&& patch -p1 /etc/prosody/prosody.cfg.lua < /usr/src/prosody.cfg.lua.patch \
	&& mkdir -p /etc/prosody/conf.d \

	&& cd /usr/src/prosody/tools/migration \
	&& make \
	&& make install \

	&& useradd -ms /bin/bash prosody \
	&& chown -R prosody /etc/prosody \
	&& chown -R prosody /var/lib/prosody \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 5222 5269 5347 5280 5281
USER prosody
CMD ["prosody"]
