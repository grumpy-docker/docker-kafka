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

Run a three node Kafka cluster where zoo1, zoo2 and zoo3 are DNS resolvable hostnames of a ZooKeeper ensemble, using a "/kafka" ZooKeeper chroot

```
weave run -dt --name=kafka1 \
  -e KAFKA_BROKER_ID=0 \
  -e KAFKA_ZK_CONNECT=zoo1.weave.local:2181,zoo2.weave.local:2182,zoo3.weave.local:2183/kafka \
  -e KAFKA_LOG_DIRS=/logs1,/logs2 \
  -e KAFKA_PORT=9092 \
  -e KAFKA_ADVERTISED_HOST_NAME=kafka1.weave.local \
  -e KAFKA_ADVERTISED_PORT=9092 \
  -v /logs1 \
  -v /logs2 \
  -p :9092:9092 \
  kafka

weave run -dt --name=kafka2 \
  -e KAFKA_BROKER_ID=1 \
  -e KAFKA_ZK_CONNECT=zoo1.weave.local:2181,zoo2.weave.local:2182,zoo3.weave.local:2183/kafka \
  -e KAFKA_LOG_DIRS=/logs1,/logs2 \
  -e KAFKA_PORT=9093 \
  -e KAFKA_ADVERTISED_HOST_NAME=kafka2.weave.local \
  -e KAFKA_ADVERTISED_PORT=9093 \
  -v /logs1 \
  -v /logs2 \
  -p :9093:9093 \
  kafka

weave run -dt --name=kafka3 \
  -e KAFKA_BROKER_ID=2 \
  -e KAFKA_ZK_CONNECT=zoo1.weave.local:2181,zoo2.weave.local:2182,zoo3.weave.local:2183/kafka \
  -e KAFKA_LOG_DIRS=/logs1,/logs2 \
  -e KAFKA_PORT=9094 \
  -e KAFKA_ADVERTISED_HOST_NAME=kafka3.weave.local \
  -e KAFKA_ADVERTISED_PORT=9094 \
  -v /logs1 \
  -v /logs2 \
  -p :9094:9094 \
  kafka
```

### Topic Management

Create a topic
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --create --zookeeper zoo1.weave.local:2181/kafka --replication-factor 2 --partitions 1 --topic test
```

List topics
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --list --zookeeper zoo1.weave.local:2181/kafka
```

Describe all topics
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --describe --zookeeper zoo1.weave.local:2181/kafka
```

Describe a specific topic
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-topics.sh --describe --zookeeper zoo1.weave.local:2181/kafka --topic test
```

Run CLI producer (note this is the "new producer" and connects to the broker to get connection metadata, not ZooKeeper directly, thus no "/kafka")
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-console-producer.sh --broker-list kafka1.weave.local:9092 --topic test
```

Run CLI consumer
```
weave run -it --rm grumpydocker/kafka /kafka/bin/kafka-console-consumer.sh --zookeeper zoo1.weave.local:2181/kafka --topic test --from-beginning
```
