# Troubleshooting Resource
For DNS troubleshooting
```
kubectl apply -f dns.yml
kubectl exec -i -t dnsutils -- nslookup kubernetes.default
```
