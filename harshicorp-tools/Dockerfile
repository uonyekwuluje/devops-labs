FROM alpine:3.12

MAINTAINER Uchechukwu Onyekwuluje <uionyekwuluje@gmail.com>

ENV TERRAFORM_VERSION="0.14.4"
ENV TERRAFORM_LOCATION="/usr/bin/terraform"
ENV PACKER_VERSION="1.6.6"
ENV PACKER_LOCATION="/usr/bin/packer"

RUN apk update && \
    apk add --no-cache curl bash tar procps git openssl unzip wget && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform ${TERRAFORM_LOCATION} && \
    rm /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN cd /tmp && \
    wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip && \
    mv packer ${PACKER_LOCATION} && \
    rm /tmp/packer_${PACKER_VERSION}_linux_amd64.zip

CMD [""]
