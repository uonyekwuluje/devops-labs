# Deploy Docker Registry
Create Registry Password
```
htpasswd -Bc registry.passwd admin
cat registry.passwd | base64 -w0
```
Update the secrets with the base64 entry



Create Deployment
```
kubectl apply -f registry-deployment.yaml
```

Check Status
```
kubectl get all -n docker-registry
NAME                                       READY   STATUS    RESTARTS   AGE
pod/registry-deployment-5cbbf779f6-j6mvf   1/1     Running   0          31s

NAME                       TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/registry-service   NodePort   10.111.240.5   <none>        5001:30500/TCP   31s

NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/registry-deployment   1/1     1            1           31s

NAME                                             DESIRED   CURRENT   READY   AGE
replicaset.apps/registry-deployment-5cbbf779f6   1         1         1       31s
```
