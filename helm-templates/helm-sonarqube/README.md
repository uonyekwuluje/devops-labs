# Create NFS Folder For Application
Create NFS folder on NFS Server
```
sudo mkdir -p /data/sonarqube/{data,postgres,extension}
sudo chmod 777 -R /data/sonarqube/
```
Mount NFS. `/etc/exports`
```
/data/sonarqube/data *(rw,sync,no_subtree_check)
/data/sonarqube/extension *(rw,sync,no_subtree_check)
/data/sonarqube/postgres *(rw,sync,no_subtree_check)
```

## Create Sonarqube Application
Create sonarqube
```
helm install sonarqube helm-sonarqube/ --values helm-sonarqube/values.yaml
```
Upgrade sonarqube
```
helm upgrade sonarqube helm-sonarqube/ --values helm-sonarqube/values.yaml
```
Delete chart
```
helm delete sonarqube
```

## Connect to Postgres
```
kubectl -n sonarqube exec --stdin --tty svc/postgres-svc -- bash
>>
psql -U postgres
```
