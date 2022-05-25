# Create SonarQube Stack
This stack includes 
* NFS Volume
* K8s Postgres

## Create Backend Stack
```
# Create backend
make build_backend

# Connect to Postgres
KUBECONFIG=~/.kube/prod-kube kubectl -n sonarqube exec --stdin --tty svc/postgres -- bash

root@postgres-6f77dd46c8-82fkw:/# psql -U postgres
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


http://192.168.1.31:30036/about
