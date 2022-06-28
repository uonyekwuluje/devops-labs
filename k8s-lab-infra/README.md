# Kubernetes Infra Labs
This is my stable collection of infra devops tools

## Install ArgoCD [ArgoCD](https://github.com/argoproj/argo-cd/releases)
```
kubectl create namespace argo-cd
VERSION="v2.4.3"
kubectl apply -n argo-cd -f https://raw.githubusercontent.com/argoproj/argo-cd/$VERSION/manifests/install.yaml
kubectl delete -n argo-cd -f https://raw.githubusercontent.com/argoproj/argo-cd/$VERSION/manifests/install.yaml
```

## ArgoCD App
```
https://192.168.1.21:30934
username: admin
password: password
```


## App Stack
```
Sonarqube: http://192.168.1.21:32003
Nexus: http://192.168.1.21:32001/
```
