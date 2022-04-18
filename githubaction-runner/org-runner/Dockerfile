FROM ubuntu:18.04

ARG RUNNER_VERSION="2.279.0"

RUN apt-get update -y && apt-get upgrade -y && useradd -m ba
RUN apt-get install -y pass software-properties-common curl wget jq build-essential unzip libssl-dev libffi-dev python python-pip apt-utils \
    && pip install yq docker ansible==2.9.10 --user

# Install Latest Git
RUN add-apt-repository ppa:git-core/ppa -y \
    && apt update && apt install -y git

RUN mkdir /opt/actions-runner && cd /opt/actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN chown -R ba:ba /opt/actions-runner && /opt/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER ba

ENTRYPOINT ["./start.sh"]
