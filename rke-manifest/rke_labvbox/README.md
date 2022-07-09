## Kubernetes Labs
rke up --config ./vbox-allinone.yml


## Rancher Setup
export VERSION="rancher/rancher:v2.6.6"
sudo docker run --privileged -d \
--restart=unless-stopped -p 80:80 -p 443:443 ${VERSION}

## RKE K8s Versions
https://github.com/rancher/rke/releases
