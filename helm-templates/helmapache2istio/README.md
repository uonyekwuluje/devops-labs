# Deploy Apache2 and Istio

## Create Apache2 Deployment and Service
```
kubectl create namespace apache2 
kubectl label namespace apache2 istio-injection=enabled
kubectl apply -f k8s-webserver/apache2-deployment.yaml
kubectl apply -f k8s-webserver/istio-apache2-deployment.yaml
```

## Test
```
kubectl describe svc istio-ingressgateway -n istio-system |grep http2
>>
Port:                     http2  80/TCP
NodePort:                 http2  30459/TCP

curl http://dev.apache2.com:30459
```
