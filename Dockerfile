FROM registry.local:5000/ctrl:latest
MAINTAINER kellman
USER root
RUN \
	apk -Uuv add --no-cache --update \ 
        py-pip build-base && \
	mkdir -p /opt/ && \
	cd /opt/ && \
	git clone https://github.com/krishnasrinivas/wetty && \
	cd /opt/wetty && \
	npm install && \
	chmod u+s /usr/bin/passwd && \
	apk --purge -v del py-pip build-base && \
	rm -rf /usr/lib/python*/ensurepip && \
	rm -rf /root/.cache
EXPOSE 3000
WORKDIR /opt/wetty
