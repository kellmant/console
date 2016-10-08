FROM registry.local:5000/ctrl:latest
MAINTAINER kellman
USER root
RUN \
	mkdir -p /opt/ && \
	cd /opt/ && \
	git clone https://github.com/krishnasrinivas/wetty && \
	cd /opt/wetty && \
	npm install && \
	rm -rf /root/.cache
EXPOSE 3000
WORKDIR /opt/wetty
