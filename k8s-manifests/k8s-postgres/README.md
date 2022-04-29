# Deploy Postgres Database

## Create Postgres 
```
kubectl apply -f postgres-deployment.yaml
```

## Test PostgresDB
```
kubectl get all -n postgresdb
kubectl -n postgresdb exec -it service/postgres-svc -- psql -h localhost -U postgres --password -p 5432 postgres
kubectl -n postgresdb exec -it service/postgres-svc -- psql -h localhost -U postgres -p 5432 postgres
kubectl -n postgresdb exec --stdin --tty svc/postgres-svc -- bash
```

## Test PostgresAdmin
```
kubectl port-forward --address 0.0.0.0 svc/pgadmin-svc -n postgresdb 8080:80
```

## Postgres Service Connection
```
postgres-svc.postgresdb.svc.cluster.local
```

## Connect to DB from within kubernetes
Get Pod Information
```
kubectl get pods

NAME                           READY   STATUS    RESTARTS   AGE
postgres-db-57876dbf88-tb8gb   1/1     Running   0          9m55s
bash-alpine                    1/1     Running   0          102s
```

login to pod, install psql and connect
```
kubectl exec --stdin --tty bash-alpine -- /bin/sh

/ # apk add --no-cache postgresql-client
/ #
/ # psql -h postgres-svc.postgresdb.svc.cluster.local -U postgres --password -p 5432 postgres
/ # psql -h postgres-svc.postgresdb.svc.cluster.local -U postgres -p 5432 postgres
Password: 
psql (12.4, server 9.5.3)
Type "help" for help.

postgres=# 
```

## Reference
https://www.enterprisedb.com/blog/how-deploy-pgadmin-kubernetes
https://www.kisphp.com/postgres/run-postgres11-and-pgadmin4-in-kubernetes-for-testing
https://severalnines.com/database-blog/using-kubernetes-deploy-postgresql
