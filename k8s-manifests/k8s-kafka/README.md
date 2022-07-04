# Deploy Kafka Zookeeper 

## Create Kafker/Zookeeper
```
kubectl apply -f kafka-deployment.yaml
```

## Check All
```
kubectl get all -n kafkaclster

NAME                                 READY   STATUS    RESTARTS   AGE
pod/kafka-broker0-865bf4497c-s6929   1/1     Running   0          11m
pod/zookeeper-7f68b4bc47-fvg8m       1/1     Running   0          16m

NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
service/kafka-svc       ClusterIP   10.109.123.119   <none>        9092/TCP                     16m
service/zookeeper-svc   ClusterIP   10.98.25.227     <none>        2181/TCP,2888/TCP,3888/TCP   16m

NAME                            READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/kafka-broker0   1/1     1            1           16m
deployment.apps/zookeeper       1/1     1            1           16m

NAME                                       DESIRED   CURRENT   READY   AGE
replicaset.apps/kafka-broker0-556f64954f   0         0         0       16m
replicaset.apps/kafka-broker0-865bf4497c   1         1         1       11m
replicaset.apps/zookeeper-7f68b4bc47       1         1         1       16m
```

## Connect and Test
```
kubectl -n kafkaclster exec --stdin --tty svc/kafka-svc -- /bin/sh

zookeeper-shell zookeeper-svc.kafkaclster.svc.cluster.local:2181 ls -s /

# List Brokers
kafka-broker-api-versions --bootstrap-server localhost:9092 | grep 9092
>>
kafka-broker0-865bf4497c-s6929:9092 (id: 0 rack: null) -> (

# Create Topic
kafka-topics --create --topic restapp --bootstrap-server localhost:9092 \
--replication-factor 1 --partitions 3  

# List Topics
kafka-topics --list --bootstrap-server localhost:9092 

# Describe Topic
kafka-topics --describe --bootstrap-server localhost:9092 --topic restapp

# Delete Topic
kafka-topics --bootstrap-server localhost:9092 --delete --topic restapp
```


# Reference Links
https://akomljen.com/kubernetes-persistent-volumes-with-deployment-and-statefulset/
https://hub.docker.com/r/confluentinc/cp-zookeeper/tags
https://medium.com/accenture-the-dock/when-how-to-deploy-kafka-on-kubernetes-b18f5270db63
https://dev.to/thegroo/running-kafka-on-kubernetes-for-local-development-2a54
