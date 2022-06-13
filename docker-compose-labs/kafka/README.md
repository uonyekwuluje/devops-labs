# Kafka Lab Stack
Small test bed for Kafka.

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
docker exec -it kafka /bin/bash
```

## Ref Links
* https://docs.confluent.io/platform/current/quickstart/ce-docker-quickstart.html
* https://github.com/confluentinc/kafka-workshop/blob/master/docker-compose.yml
* https://github.com/conduktor/kafka-stack-docker-compose/blob/master/zk-multiple-kafka-single.yml
