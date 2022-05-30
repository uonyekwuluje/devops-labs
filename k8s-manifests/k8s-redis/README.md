# Deploy Redis Pod
```
kubectl apply -f redis-deployment.yml
```

## Test
```
kubectl -n redis exec -it redis-pod -- redis-cli
#->
127.0.0.1:6379> ping
PONG

127.0.0.1:6379> CONFIG GET maxmemory
1) "maxmemory"
2) "0"
127.0.0.1:6379> 
```

## References
* https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/
