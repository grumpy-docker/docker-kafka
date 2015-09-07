### Dockerized Kafka

 The following replacements will take place based on ENV_VAR / kafka server property, check the [Kafka documentation section 3.1](http://kafka.apache.org/documentation.html) for their full meaning.

 The replacements will take place on the default Kafka distribution `conf/server.properties` file, [for example](https://github.com/apache/kafka/blob/0.8.2.1/config/server.properties)

#### * REQUIRED *

|ENV VAR|Kafka server property|
|-------|---------------------|
|KAFKA_BROKER_ID|broker.id|
|KAFKA_LOG_DIRS|log.dirs|
|KAFKA_ZK_CONNECT|zookeeper.connect|


#### * OPTIONAL *

|ENV VAR|Kafka server property|
|-------|---------------------|
|KAFKA_PORT|port|
|KAFKA_HOSTNAME|host.name|
|KAFKA_ADVERTISED_HOST_NAME|advertised.host.name|
|KAFKA_ADVERTISED_PORT|advertised.port|
|KAFKA_NUM_PARTITIONS|num.partitions|
|KAFKA_NUM_NETWORK_THREADS|num.network.threads|
|KAFKA_NUM_IO_THREADS|num.io.threads|
|KAFKA_SOCKET_SEND_BUFFER_BYTES|socket.send.buffer.bytes|
|KAFKA_SOCKET_RECEIVE_BUFFER_BYTES|socket.receive.buffer.bytes|
|KAFKA_SOCKET_REQUEST_MAX_BYTES|socket.request.max.bytes|
|KAFKA_LOG_RETENTION_HOURS|log.retention.hours|
|KAFKA_LOG_RETENTION_BYTES|log.retention.bytes|
|KAFKA_LOG_SEGMENT_BYTES|log.segment.bytes|
|KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS|log.retention.check.interval.ms|
|KAFKA_LOG_FLUSH_INTERVAL_MESSAGES|log.flush.interval.messages|
|KAFKA_LOG_FLUSH_INTERVAL_MS|log.flush.interval.ms|
|KAFKA_ZK_TIMEOUT_MS|zookeeper.connection.timeout.ms|

### Ports

9092

### Volumes

None by default, a volume per log dir should be created at runtime and specified via the `KAFKA_LOG_DIRS` environment variable as a CSV

### Examples

These examples assume a overlay network which provides DNS resolution across docker containers, such as [Weave](https://github.com/weaveworks/weave)

Run a three node Kafka cluster where zoo1, zoo2 and zoo3 are DNS resolvable hostnames of a ZooKeeper ensemble

```
weave run -dt --name=kafka1 \
 -e KAFKA_BROKER_ID=0 \
 -e KAFKA_ZK_CONNECT=zoo1:2181,zoo2:2181,zoo3:2181/kafka \
 -e KAFKA_LOG_DIRS=/logs1,/logs2 \
 -v /logs1 \
 -v /logs2 \
 grumpydocker/kafka

weave run -dt --name=kafka2 \
 -e KAFKA_BROKER_ID=1 \
 -e KAFKA_ZK_CONNECT=zoo1:2181,zoo2:2181,zoo3:2181/kafka \
 -e KAFKA_LOG_DIRS=/logs1,/logs2 \
 -v /logs1 \
 -v /logs2 \
 grumpydocker/kafka

weave run -dt --name=kafka3 \
 -e KAFKA_BROKER_ID=2 \
 -e KAFKA_ZK_CONNECT=zoo1:2181,zoo2:2181,zoo3:2181/kafka \
 -e KAFKA_LOG_DIRS=/logs1,/logs2 \
 -v /logs1 \
 -v /logs2 \
 grumpydocker/kafka
```

### Topic Management

Create a topic
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --create --zookeeper zoo1:2181/kafka --replication-factor 1 --partitions 1 --topic test
```

List topics
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --list --zookeeper zoo1:2181/kafka
```

Describe all topics
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --describe --zookeeper zoo1:2181/kafka
```

Describe a specific topic
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --describe --zookeeper zoo1:2181/kafka --topic test
```
