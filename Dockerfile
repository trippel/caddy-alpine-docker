FROM alpine
MAINTAINER T. Rippel <tristan.rippel@gmail.com>

RUN	apk add --update curl && \
	rm -rf /var/cache/apk/*

ADD Caddyfile /

RUN mkdir /root/caddy && \
	curl -sL -o /root/caddy/caddy.tgz "https://caddyserver.com/download/linux/amd64?license=" && \
	tar -xf /root/caddy/caddy.tgz -C /root/caddy && \
	mv /root/caddy/caddy /usr/bin/caddy && \
	chmod 755 /usr/bin/caddy && \
	rm -rf /root/caddy

EXPOSE 80
EXPOSE 443
EXPOSE 2015

VOLUME /var/www
WORKDIR /var/www

CMD /usr/bin/caddy --conf /Caddyfile
