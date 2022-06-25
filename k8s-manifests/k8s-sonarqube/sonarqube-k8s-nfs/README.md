# Create SonarQube Stack
Create Folders on NFS Server
```
sudo mkdir -p /data/sonarqube/{postgres,data,extensions}
sudo mkdir -p /data/sonarqube/extensions/{downloads,plugins}
sudo chmod 0777 -R /data/sonarqube/
```

Download Plugins into NFS Share
```
wget https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.9.0/sonarqube-community-branch-plugin-1.9.0.jar
wget https://github.com/gabrie-allaigre/sonar-gitlab-plugin/releases/download/4.0.0/sonar-gitlab-plugin-4.0.0.jar
sudo cp sonar-gitlab-plugin-4.0.0.jar sonarqube-community-branch-plugin-1.9.0.jar /data/sonarqube/extensions/plugins/
```

Mount NFS Shares
```
sudo cat /etc/exports
>> 
/data/sonarqube/postgres   *(rw,sync,no_subtree_check,no_root_squash)
/data/sonarqube/data       *(rw,sync,no_subtree_check,no_root_squash)
/data/sonarqube/extensions *(rw,sync,no_subtree_check,no_root_squash)
```
sudo exportfs -arv


## Images
Postgres: https://hub.docker.com/_/postgres
Sonarqube: https://hub.docker.com/_/sonarqube

## Create Base64 Password
```
echo -n 'securepassword' | base64
>>
c2VjdXJlcGFzc3dvcmQ=
```


## Create Backend Stack 
```
# Create Backend
make build_backend

# Connect to Postgres
KUBECONFIG=~/.kube/work-kube kubectl -n sonarqube exec --stdin --tty svc/postgres-svc -- bash
psql -h localhost -U sadmin --password -p 5432 sonardb
psql (10.1)
Type "help" for help.

postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 sonar     | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(4 rows)

postgres=# \q

# Destroy Backend
make destroy_backend
```

## Create Sonarqube
```
# Create Sonarqube
make build_sonarqube

# Connect
KUBECONFIG=~/.kube/work-kube kubectl -n sonarqube exec --stdin --tty svc/sonarqube-svc -- bash

http://192.168.1.22:30036/
```


## Plugins
* [Multi Branch Plugin](https://github.com/mc1arke/sonarqube-community-branch-plugin)
