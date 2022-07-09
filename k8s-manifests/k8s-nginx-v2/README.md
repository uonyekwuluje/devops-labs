# Deploy nginx 

## Create nginx Deployment and Service
```
kubectl apply -f nginx-deployment.yaml
```

## Test Application
```
curl 192.168.1.41:30036
```
