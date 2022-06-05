# Create SonarQube Stack
Create Folders on Worker Node
```
mkdir -p /data/sonarqube/{data,extensions,postgres}
mkdir -p /data/sonarqube/extensions/plugins
chmod 777 /data/sonarqube/
```

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
psql -U postgres
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

