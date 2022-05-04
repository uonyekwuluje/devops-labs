FROM ubuntu:18.04

ARG RUNNER_VERSION="2.288.1"
ARG TERRAFORM_VERSION="1.1.6"
ARG TERRAFORM_LOCATION="/usr/bin/terraform"

RUN apt-get update -y && apt-get upgrade -y && useradd -m ubuntu
RUN apt-get install -y pass software-properties-common curl wget jq build-essential unzip libssl-dev libffi-dev python python-pip apt-utils \
    && pip install yq docker ansible==2.9.10 --user

# Install Latest Git
RUN add-apt-repository ppa:git-core/ppa -y \
    && apt update && apt install -y git

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && mv terraform ${TERRAFORM_LOCATION} \
   && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN mkdir /opt/actions-runner && cd /opt/actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN chown -R ubuntu:ubuntu /opt/actions-runner && /opt/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER ubuntu

ENTRYPOINT ["./start.sh"]
