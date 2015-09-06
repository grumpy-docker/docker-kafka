weave run -it --rm --name=kafka1 \
 -e KAFKA_BROKER_ID=0 \
 -e KAFKA_ZK_CONNECT=zoo1:2181 \
 -e KAFKA_LOG_DIRS=/logs1 \
 -v /logs1 \
 kafka

 # KAFKA_BROKER_ID / broker.id
 # port 9092
 # KAFKA_HOSTNAME / #host.name (bind to hostname, default is all interfaces)
 # KAFKA_ADVERTISED_HOST_NAME / #advertised.host.name
 # KAFKA_ADVERTISED_PORT / #advertised.port
 # KAFKA_LOG_DIRS / log.dirs
 # KAFKA_NUM_PARTITIONS / num.partitions (default num partitions)
 # KAFKA_LOG_RETENTION_HOURS / log.retention.hours
 # KAFKA_LOG_RETENTION_BYTES / log.retention.bytes
 # KAFKA_ZK_CONNECT / zookeeper.connect
