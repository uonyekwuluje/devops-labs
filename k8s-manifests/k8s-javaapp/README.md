# Deploy Java Application

## Create JAVA Deployment & Service
Apply Config
```
KUBECONFIG=~/.kube/work-kube kubectl apply -f deployment.yaml
```
Test Config
```
KUBECONFIG=~/.kube/prod-kube kubectl port-forward --address 0.0.0.0 svc/japp-service -n japp-ns 8080:80
```
