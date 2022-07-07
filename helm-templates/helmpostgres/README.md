# Deploy Postgres Database

## Test PostgresDB
```
kubectl get all -n postgresdb
kubectl -n postgresdb exec -it service/postgres-svc -- psql -h localhost -U postgres --password -p 5432 postgres
kubectl -n postgresdb exec -it service/postgres-svc -- psql -h localhost -U postgres -p 5432 postgres
kubectl -n postgresdb exec --stdin --tty svc/postgres-svc -- bash
```
