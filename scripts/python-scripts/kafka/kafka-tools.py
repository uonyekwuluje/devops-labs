#!/usr/bin/env python3
import kafka
from kafka.admin import KafkaAdminClient, NewTopic

def listTopics(broker):
    """ List Kafka Topics """
    client = kafka.KafkaAdminClient(bootstrap_servers=[broker])
    for topic in client.list_topics():
        print(topic)

def createTopic(broker,topic):
    admin_client = KafkaAdminClient(bootstrap_servers=broker)
    topic_list = []
    topic_list.append(NewTopic(name=topic, num_partitions=1, replication_factor=1))
    admin_client.create_topics(new_topics=topic_list, validate_only=False)



if __name__ == "__main__":
    broker_server = "192.168.1.112"
    new_topic = "testtopic"
    listTopics(broker_server)
#    createTopic(broker_server,new_topic)
