# Troubleshooting Resource
For DNS troubleshooting
```
kubectl apply -f troubleshooting.yml
kubectl -n troubleshooting exec -i -t dnsutils -- nslookup kubernetes.default
kubectl -n troubleshooting exec --stdin --tty dnsutils -- /bin/bash
kubectl -n troubleshooting exec --stdin --tty ubuntu -- /bin/bash
```
