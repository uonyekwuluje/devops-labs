#!/bin/bash

OWNER=$OWNER
ACCESS_TOKEN=$ACCESS_TOKEN
BUILD_LABELS=$BUILD_LABELS
REPOSITORY=$REPOSITORY

REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/repos/${OWNER}/${REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)

cd /opt/actions-runner

./config.sh  \
--url https://github.com/${OWNER}/${REPOSITORY} \
--token ${REG_TOKEN} \
--labels ${BUILD_LABELS} \
--unattended --replace

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
