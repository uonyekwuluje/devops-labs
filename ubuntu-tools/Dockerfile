FROM ubuntu:18.04
MAINTAINER Infra Admin <info@infracid.com>
ARG BUILD_VERSION="v1.1.0"
ENV GOLANG_VERSION="1.16.2"

RUN apt update -y && apt upgrade -y 
RUN apt install -y wget jq curl dnsutils iputils-ping iproute2 openssl dumb-init percona-toolkit apt-utils bind9-doc \
    bind9utils whois cracklib-runtime redis-tools net-tools dnsutils build-essential ca-certificates lsb-release

RUN cd /tmp && \
    wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -xvf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    mv go /usr/local && \
    GOROOT=/usr/local/go /usr/local/go/bin/go get github.com/go-delve/delve/cmd/dlv && \
    rm -Rf /tmp/*

ENV PATH="/root/go/bin:/usr/local/go/bin:${PATH}"
LABEL build_version="$BUILD_VERSION" 
CMD ["/bin/bash"]
