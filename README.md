# DevOps SRE Tools
This is a collection of Docker, Kubernetes, Container, Scripts etc. for DevOps/SRE related tasks

## Image Builds
List of custom docker images for select tools
* [GitHub Action Runner Image](/docker-image-builds/githubaction-runner)
* [Harshicorp Cloud Tools](/docker-image-builds/harshicorp-tools)
* [Java and Maven Build Tools](/docker-image-builds/java-build-tools)
* [Ubuntu Versions](/docker-image-builds/ubuntu-tools)

## Kubernetes Cheat sheets
List of K8s snippets, configs and manifests
* [MySQL & NFS PV](/k8s-manifests/k8s-storage)

## Install Istio
Check `https://github.com/istio/istio` for the release of your choice. Also ensure you have kubernetes up and running
```
export ISTIO_VERSION="1.13.3"
curl -LOs https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz
sudo tar zxvf istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz -C /bin/
rm istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz
sudo chmod a+x /bin/istioctl
# Check version
istioctl version
```
Install
```
istioctl x precheck
istioctl install
```

## Install ArgoCD and ArgoCD CLI
My K8s Reminder will be driven by ArgoCD
```
kubectl create namespace argo-cd
VERSION="v2.3.3"
kubectl apply -n argo-cd -f https://raw.githubusercontent.com/argoproj/argo-cd/$VERSION/manifests/install.yaml
```

ArgoCD CLI
```
VERSION="v2.3.3"
wget https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod a+x argocd-linux-amd64
sudo mv argocd-linux-amd64 /bin/argocd
```

## ArgoCD Apps
```
kubectl apply -f argo-apps/argo-nginx-deploy.yml
```
