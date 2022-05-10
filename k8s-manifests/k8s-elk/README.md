# Deploy ELK Stack
```
kubectl apply -f logging-ns.yml 
kubectl apply -f logging-elasticsearch-ss.yml  
kubectl apply -f logging-kibana-deployment.yml  
```

## Test
```
kubectl port-forward --address 0.0.0.0 svc/kibana -n logging 5601:5601 
```
Login to verify it's there

## References
* https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes
* https://qbox.io/blog/shipping-kubernetes-cluster-metrics-to-elasticsearch-with-metricbeat/
* https://coralogix.com/blog/kubernetes-logging-with-elasticsearch-fluentd-and-kibana/
* https://computingforgeeks.com/forward-kubernetes-logs-to-elasticsearch-using-fluentbit/
