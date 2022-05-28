# Radis Docker App
Small test bed for redis.

## Redis Docker Compose 
```
# Start
docker-compose up -d
docker-compose up -d --force-recreate --remove-orphans

# Stop
docker-compose down
```

## Operations
Adhoc Operations
```
# Connect
docker exec -it redis-server /bin/sh
```
