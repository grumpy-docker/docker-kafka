### Dockerized Kafka

 The following replacements will take place based on ENV_VAR / kafka server property, check the [Kafka documentation section 3.1](http://kafka.apache.org/documentation.html) for their full meaning.

 The replacements will take place on the default Kafka distribution `conf/server.properties` file, [for example](https://github.com/apache/kafka/blob/0.8.2.1/config/server.properties)

#### * REQUIRED *

|ENV VAR|Kafka server property|
|-------|---------------------|
|KAFKA_BROKER_ID|broker.id|
|KAFKA_LOG_DIRS|log.dirs|
|KAFKA_ZK_CONNECT|zookeeper.connect|


#### * OPTIONAL, SET BY DEFAULT *

|ENV VAR|Kafka server property|Default|
|-------|---------------------|-------|
|KAFKA_PORT|port|9092|
|KAFKA_NUM_PARTITIONS|num.partitions|1|
|KAFKA_AUTO_CREATE_TOPICS_ENABLE|auto.create.topics.enable|false|
|KAFKA_DEFAULT_REPLICATION_FACTOR|default.replication.factor|1|
|KAFKA_MESSAGE_MAX_BYTES|message.max.bytes|20971520|
|KAFKA_REPLICA_FETCH_MAX_BYTES|replica.fetch.max.bytes|20971520|

### * OPTIONAL, NOT SET BY DEFAULT *

|ENV VAR|Kafka server property|Default|
|-------|---------------------|-------|
|KAFKA_ADVERTISED_HOST_NAME|advertised.host.name|kafka1|
|KAFKA_ADVERTISED_LISTENERS|advertised.listeners||
|KAFKA_ADVERTISED_PORT|advertised.port|9092|
|KAFKA_AUTHORIZER_CLASS_NAME|authorizer.class.name||
|KAFKA_AUTO_LEADER_REBALANCE_ENABLE|auto.leader.rebalance.enable|true|
|KAFKA_BACKGROUND_THREADS|background.threads|10|
|KAFKA_COMPRESSION_TYPE|compression.type|producer|
|KAFKA_CONNECTIONS_MAX_IDLE_MS|connections.max.idle.ms|600000|
|KAFKA_CONTROLLED_SHUTDOWN_ENABLE|controlled.shutdown.enable|true|
|KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES|controlled.shutdown.max.retries|3|
|KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS|controlled.shutdown.retry.backoff.ms|5000|
|KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS|controller.socket.timeout.ms|30000|
|KAFKA_DELETE_TOPIC_ENABLE|delete.topic.enable|false|
|KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS|fetch.purgatory.purge.interval.requests|1000|
|KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS|group.max.session.timeout.ms|30000|
|KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS|group.min.session.timeout.ms|6000|
|KAFKA_HOST_NAME|host.name|0.0.0.0|
|KAFKA_INTER_BROKER_PROTOCOL_VERSION|inter.broker.protocol.version|0.9.0.X|
|KAFKA_LISTENERS|listeners|PLAINTEXT://:9092|
|KAFKA_LOG_CLEANER_BACKOFF_MS|log.cleaner.backoff.ms|15000|
|KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE|log.cleaner.dedupe.buffer.size|524288000|
|KAFKA_LOG_CLEANER_DELETE_RETENTION_MS|log.cleaner.delete.retention.ms|86400000|
|KAFKA_LOG_CLEANER_ENABLE|log.cleaner.enable|false|
|KAFKA_LOG_CLEANER_ENABLE|log.cleaner.enable|false|
|KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR|log.cleaner.io.buffer.load.factor|0.9|
|KAFKA_LOG_CLEANER_IO_BUFFER_SIZE|log.cleaner.io.buffer.size|524288|
|KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND|log.cleaner.io.max.bytes.per.second|1.7976931348623157E308|
|KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO|log.cleaner.min.cleanable.ratio|0.5|
|KAFKA_LOG_CLEANER_THREADS|log.cleaner.threads|1|
|KAFKA_LOG_CLEANUP_POLICY|log.cleanup.policy|delete|
|KAFKA_LOG_FLUSH_INTERVAL_MESSAGES|log.flush.interval.messages|9223372036854775807|
|KAFKA_LOG_FLUSH_INTERVAL_MS|log.flush.interval.ms||
|KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS|log.flush.offset.checkpoint.interval.ms|60000|
|KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS|log.flush.scheduler.interval.ms|9223372036854775807|
|KAFKA_LOG_INDEX_INTERVAL_BYTES|log.index.interval.bytes|4096|
|KAFKA_LOG_INDEX_SIZE_MAX_BYTES|log.index.size.max.bytes|10485760|
|KAFKA_LOG_PREALLOCATE|log.preallocate|false|
|KAFKA_LOG_RETENTION_BYTES|log.retention.bytes|-1|
|KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS|log.retention.check.interval.ms|300000|
|KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS|log.retention.check.interval.ms|300000|
|KAFKA_LOG_RETENTION_HOURS|log.retention.hours|168|
|KAFKA_LOG_RETENTION_HOURS|log.retention.hours|876000|
|KAFKA_LOG_RETENTION_MINUTES|log.retention.minutes||
|KAFKA_LOG_RETENTION_MS|log.retention.ms||
|KAFKA_LOG_ROLL_HOURS|log.roll.hours|168|
|KAFKA_LOG_ROLL_JITTER_HOURS|log.roll.jitter.hours|0|
|KAFKA_LOG_ROLL_JITTER_MS|log.roll.jitter.ms||
|KAFKA_LOG_ROLL_MS|log.roll.ms||
|KAFKA_LOG_SEGMENT_BYTES|log.segment.bytes|1073741824|
|KAFKA_LOG_SEGMENT_BYTES|log.segment.bytes|1073741824|
|KAFKA_LOG_SEGMENT_DELETE_DELAY_MS|log.segment.delete.delay.ms|60000|
|KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES|max.connections.per.ip.overrides||
|KAFKA_MAX_CONNECTIONS_PER_IP|max.connections.per.ip|2147483647|
|KAFKA_METRIC_REPORTERS|metric.reporters|[]|
|KAFKA_METRICS_NUM_SAMPLES|metrics.num.samples|2|
|KAFKA_METRICS_SAMPLE_WINDOW_MS|metrics.sample.window.ms|30000|
|KAFKA_MIN_INSYNC_REPLICAS|min.insync.replicas|1|
|KAFKA_NUM_IO_THREADS|num.io.threads|8|
|KAFKA_NUM_IO_THREADS|num.io.threads|8|
|KAFKA_NUM_NETWORK_THREADS|num.network.threads|3|
|KAFKA_NUM_NETWORK_THREADS|num.network.threads|3|
|KAFKA_NUM_PARTITIONS|num.partitions|1|
|KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR|num.recovery.threads.per.data.dir|1|
|KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR|num.recovery.threads.per.data.dir|1|
|KAFKA_NUM_REPLICA_FETCHERS|num.replica.fetchers|1|
|KAFKA_OFFSET_METADATA_MAX_BYTES|offset.metadata.max.bytes|4096|
|KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS|offsets.commit.required.acks|-1|
|KAFKA_OFFSETS_COMMIT_TIMEOUT_MS|offsets.commit.timeout.ms|5000|
|KAFKA_OFFSETS_LOAD_BUFFER_SIZE|offsets.load.buffer.size|5242880|
|KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS|offsets.retention.check.interval.ms|600000|
|KAFKA_OFFSETS_RETENTION_MINUTES|offsets.retention.minutes|1440|
|KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC|offsets.topic.compression.codec|0|
|KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS|offsets.topic.num.partitions|50|
|KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR|offsets.topic.replication.factor|3|
|KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES|offsets.topic.segment.bytes|104857600|
|KAFKA_PRINCIPAL_BUILDER_CLASS|principal.builder.class|org.apache.kafka.common.security.auth.DefaultPrincipalBuilder|
|KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS|producer.purgatory.purge.interval.requests|1000|
|KAFKA_QUEUED_MAX_REQUESTS|queued.max.requests|500|
|KAFKA_QUOTA_CONSUMER_DEFAULT|quota.consumer.default|9223372036854775807|
|KAFKA_QUOTA_PRODUCER_DEFAULT|quota.producer.default|9223372036854775807|
|KAFKA_QUOTA_WINDOW_NUM|quota.window.num|11|
|KAFKA_QUOTA_WINDOW_SIZE_SECONDS|quota.window.size.seconds|1|
|KAFKA_REPLICA_FETCH_BACKOFF_MS|replica.fetch.backoff.ms|1000|
|KAFKA_REPLICA_FETCH_MIN_BYTES|replica.fetch.min.bytes|1|
|KAFKA_REPLICA_FETCH_WAIT_MAX_MS|replica.fetch.wait.max.ms|500|
|KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS|replica.high.watermark.checkpoint.interval.ms|5000|
|KAFKA_REPLICA_LAG_TIME_MAX_MS|replica.lag.time.max.ms|10000|
|KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES|replica.socket.receive.buffer.bytes|65536|
|KAFKA_REPLICA_SOCKET_TIMEOUT_MS|replica.socket.timeout.ms|30000|
|KAFKA_REQUEST_TIMEOUT_MS|request.timeout.ms|30000|
|KAFKA_RESERVED_BROKER_MAX_ID|reserved.broker.max.id|1000|
|KAFKA_SASL_KERBEROS_KINIT_CMD|sasl.kerberos.kinit.cmd|/usr/bin/kinit|
|KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN|sasl.kerberos.min.time.before.relogin|60000|
|KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES|sasl.kerberos.principal.to.local.rules|[DEFAULT]|
|KAFKA_SASL_KERBEROS_SERVICE_NAME|sasl.kerberos.service.name||
|KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER|sasl.kerberos.ticket.renew.jitter|0.05|
|KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR|sasl.kerberos.ticket.renew.window.factor|0.8|
|KAFKA_SECURITY_INTER_BROKER_PROTOCOL|security.inter.broker.protocol|PLAINTEXT|
|KAFKA_SOCKET_RECEIVE_BUFFER_BYTES|socket.receive.buffer.bytes|102400|
|KAFKA_SOCKET_RECEIVE_BUFFER_BYTES|socket.receive.buffer.bytes|102400|
|KAFKA_SOCKET_REQUEST_MAX_BYTES|socket.request.max.bytes|104857600|
|KAFKA_SOCKET_REQUEST_MAX_BYTES|socket.request.max.bytes|104857600|
|KAFKA_SOCKET_SEND_BUFFER_BYTES|socket.send.buffer.bytes|102400|
|KAFKA_SOCKET_SEND_BUFFER_BYTES|socket.send.buffer.bytes|102400|
|KAFKA_SSL_CIPHER_SUITES|ssl.cipher.suites||
|KAFKA_SSL_CLIENT_AUTH|ssl.client.auth|none|
|KAFKA_SSL_ENABLED_PROTOCOLS|ssl.enabled.protocols|[TLSv1.2]|
|KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM|ssl.endpoint.identification.algorithm||
|KAFKA_SSL_KEY_PASSWORD|ssl.key.password||
|KAFKA_SSL_KEYMANAGER_ALGORITHM|ssl.keymanager.algorithm|SunX509|
|KAFKA_SSL_KEYSTORE_LOCATION|ssl.keystore.location||
|KAFKA_SSL_KEYSTORE_PASSWORD|ssl.keystore.password||
|KAFKA_SSL_KEYSTORE_TYPE|ssl.keystore.type|JKS|
|KAFKA_SSL_PROTOCOL|ssl.protocol|TLS|
|KAFKA_SSL_PROVIDER|ssl.provider||
|KAFKA_SSL_TRUSTMANAGER_ALGORITHM|ssl.trustmanager.algorithm|PKIX|
|KAFKA_SSL_TRUSTSTORE_LOCATION|ssl.truststore.location||
|KAFKA_SSL_TRUSTSTORE_PASSWORD|ssl.truststore.password||
|KAFKA_SSL_TRUSTSTORE_TYPE|ssl.truststore.type|JKS|
|KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE|unclean.leader.election.enable|true|
|KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS|zookeeper.connection.timeout.ms||
|KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS|zookeeper.session.timeout.ms|6000|
|KAFKA_ZOOKEEPER_SET_ACL|zookeeper.set.acl|false|
|KAFKA_ZOOKEEPER_SYNC_TIME_MS|zookeeper.sync.time.ms|2000|

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
