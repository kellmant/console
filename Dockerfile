FROM registry.local:5000/base:latest
MAINTAINER kellman
RUN \
        apk -Uuv add --no-cache --update \ 
	git nodejs python py-pip python3 ncurses unrar curl jq tree groff less vim screen \ 
        lynx build-base linux-pam rsync openssl openssh-client sudo perl irssi irssi-perl && \
	chmod u+s /usr/bin/passwd && \
	echo "Gateway To The Sky Project" > /etc/motd && \
	echo "IronMan Release " >> /etc/motd && \
	echo " " >> /etc/motd && \
	python3 -m ensurepip && \
	pip install --upgrade pip setuptools && \
	pip install awscli && \
	pip install aws-shell && \
	npm install -g azure-cli && \
	npm install -g hexo-cli && \
	mkdir -p /tmp/build && cd /tmp/build && \
	curl -L https://github.com/coreos/etcd/releases/download/v3.0.9/etcd-v3.0.9-linux-amd64.tar.gz -o etcd-v3.0.9-linux-amd64.tar.gz && \
	tar xzvf etcd-v3.0.9-linux-amd64.tar.gz && cd etcd-v3.0.9-linux-amd64 && \
	cp ./etcdctl /usr/bin/ && cd /tmp/build && \
	curl -L https://github.com/coreos/fleet/releases/download/v0.11.8/fleet-v0.11.8-linux-amd64.tar.gz -o fleet.tar.gz && \
	tar xzvf fleet.tar.gz && cd fleet-v0.11.8-linux-amd64 && \
	cp ./fleetctl /usr/bin/ && \
	mkdir -p /opt/ && \
	cd /opt/ && \
	git clone https://github.com/krishnasrinivas/wetty && \
	cd /opt/wetty && \
	npm install && \
	apk --purge -v del py-pip build-base && \
	rm -rf /usr/lib/python*/ensurepip && \
	rm -rf /root/.cache && \
	rm -rf /tmp/fleet && \
	rm -rf /tmp/* && \
	rm -rf /var/cache/apk/*
EXPOSE 3000
WORKDIR /opt/wetty
