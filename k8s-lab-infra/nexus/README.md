# Create Nexus3 Sonartype
Create Nexus Sonatype

Create Stack
```
make build
```

Destroy Stack
```
make destroy
```

Port Forward
```
kubectl port-forward --address 0.0.0.0 nexus3-deployment-5cd8784495-276ml -n nexus3-sonartype 8081
```

Get Password
```
kubectl exec nexus3-deployment-5cd8784495-276ml -n nexus3-sonartype cat /nexus-data/admin.password
```

Access UI
```
http://192.168.1.20:32000/
username: admin
password: password
```

Docker Login Test
```
sudo docker login 192.168.1.20:32001 -u admin -p password
```

## Resources
* [Nexus3 Sonatype](https://hub.docker.com/r/sonatype/nexus3/tags)

