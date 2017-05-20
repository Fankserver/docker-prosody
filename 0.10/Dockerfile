FROM ubuntu:16.04

LABEL maintainer "Florian Kinder <florian.kinder@fankserver.com>"

COPY ./prosody.cfg.lua.patch /usr/src/prosody.cfg.lua.patch

RUN apt-get update -qq \
	&& apt-get install mercurial -yqqq \
	&& hg clone https://hg.prosody.im/0.10 /usr/src/prosody \
	&& hg clone https://hg.prosody.im/prosody-modules /usr/src/modules \

	&& cd /usr/src/prosody \
	&& apt-get install lua5.1 luarocks libexpat1-dev libssl-dev bsdmainutils git libidn11-dev -yqqq \
	&& luarocks install luasec \
	&& luarocks install luaexpat \
	&& luarocks install luasocket \
	&& luarocks install luafilesystem \
	&& luarocks install luabitop \
	&& ./configure --prefix=/ \
	&& make \
	&& make install \
	&& patch -p1 /etc/prosody/prosody.cfg.lua < /usr/src/prosody.cfg.lua.patch \
	&& useradd -ms /bin/bash prosody \
	&& chown -R prosody /etc/prosody \
	&& chown -R prosody /var/lib/prosody \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 5222 5269 5347 5280 5281
USER prosody
CMD ["prosody"]