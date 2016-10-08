FROM registry.local:5000/ctrl:latest
MAINTAINER kellman
RUN \
	mkdir -p /opt/ && \
	cd /opt/ && \
	git clone https://github.com/krishnasrinivas/wetty && \
	cd /opt/wetty && \
	npm install && \
	rm -rf /root/.cache
EXPOSE 3000
USER root
WORKDIR /opt/wetty
