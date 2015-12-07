#!/bin/sh

echo "Checking pre-conditions..."

if [ -z "${KAFKA_BROKER_ID}" ]; then
    echo "Missing required environment variable KAFKA_BROKER_ID"
    exit 1
fi

if [ -z "${KAFKA_LOG_DIRS}" ]; then
    echo "Missing required environment variable KAFKA_LOG_DIRS"
    exit 1
fi

if [ -z "${KAFKA_ZK_CONNECT}" ]; then
    echo "Missing required environment variable KAFKA_ZK_CONNECT"
    exit 1
fi

echo "Setting up /kafka/config/server.properties based on environment variables..."

if [ ! -z "${KAFKA_AUTO_CREATE_TOPICS_ENABLE}" ]; then
    echo "KAFKA_AUTO_CREATE_TOPICS_ENABLE: ${KAFKA_AUTO_CREATE_TOPICS_ENABLE}"
    sed -r -i "s/(auto\.create\.topics\.enable)=.*/\1=${KAFKA_AUTO_CREATE_TOPICS_ENABLE}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_BROKER_ID}" ]; then
    echo "KAFKA_BROKER_ID: ${KAFKA_BROKER_ID}"
    sed -r -i "s/(broker\.id)=.*/\1=${KAFKA_BROKER_ID}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_DEFAULT_REPLICATION_FACTOR}" ]; then
    echo "KAFKA_DEFAULT_REPLICATION_FACTOR: ${KAFKA_DEFAULT_REPLICATION_FACTOR}"
    sed -r -i "s/(default\.replication\.factor)=.*/\1=${KAFKA_DEFAULT_REPLICATION_FACTOR}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_DIRS}" ]; then
    echo "KAFKA_LOG_DIRS: ${KAFKA_LOG_DIRS}"
    sed -r -i "s|(log\.dirs)=.*|\1=${KAFKA_LOG_DIRS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_MESSAGE_MAX_BYTES}" ]; then
    echo "KAFKA_MESSAGE_MAX_BYTES: ${KAFKA_MESSAGE_MAX_BYTES}"
    sed -r -i "s/(message\.max\.bytes)=.*/\1=${KAFKA_MESSAGE_MAX_BYTES}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_FETCH_MAX_BYTES}" ]; then
  echo "KAFKA_REPLICA_FETCH_MAX_BYTES: ${KAFKA_REPLICA_FETCH_MAX_BYTES}"
  sed -r -i "s|(replica.fetch.max.bytes)=.*|\1=${KAFKA_REPLICA_FETCH_MAX_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_PARTITIONS}" ]; then
    echo "KAFKA_NUM_PARTITIONS: ${KAFKA_NUM_PARTITIONS}"
    sed -r -i "s/(num\.partitions)=.*/\1=${KAFKA_NUM_PARTITIONS}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_PORT}" ]; then
    echo "KAFKA_PORT: ${KAFKA_PORT}"
    sed -r -i "s/(port)=.*/\1=${KAFKA_PORT}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZK_CONNECT}" ]; then
    echo "KAFKA_ZK_CONNECT: ${KAFKA_ZK_CONNECT}"
    sed -r -i "s|(zookeeper\.connect)=.*|\1=${KAFKA_ZK_CONNECT}|g" /kafka/config/server.properties
fi


# BELOW THIS LINE ARE COMMENTED BY DEFAULT

if [ ! -z "${KAFKA_ADVERTISED_HOST_NAME}" ]; then
  echo "KAFKA_ADVERTISED_HOST_NAME: ${KAFKA_ADVERTISED_HOST_NAME}"
  sed -r -i "s|#(advertised.host.name)=.*|\1=${KAFKA_ADVERTISED_HOST_NAME}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ADVERTISED_LISTENERS}" ]; then
  echo "KAFKA_ADVERTISED_LISTENERS: ${KAFKA_ADVERTISED_LISTENERS}"
  sed -r -i "s|#(advertised.listeners)=.*|\1=${KAFKA_ADVERTISED_LISTENERS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ADVERTISED_PORT}" ]; then
  echo "KAFKA_ADVERTISED_PORT: ${KAFKA_ADVERTISED_PORT}"
  sed -r -i "s|#(advertised.port)=.*|\1=${KAFKA_ADVERTISED_PORT}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_AUTHORIZER_CLASS_NAME}" ]; then
  echo "KAFKA_AUTHORIZER_CLASS_NAME: ${KAFKA_AUTHORIZER_CLASS_NAME}"
  sed -r -i "s|#(authorizer.class.name)=.*|\1=${KAFKA_AUTHORIZER_CLASS_NAME}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_AUTO_LEADER_REBALANCE_ENABLE}" ]; then
  echo "KAFKA_AUTO_LEADER_REBALANCE_ENABLE: ${KAFKA_AUTO_LEADER_REBALANCE_ENABLE}"
  sed -r -i "s|#(auto.leader.rebalance.enable)=.*|\1=${KAFKA_AUTO_LEADER_REBALANCE_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_BACKGROUND_THREADS}" ]; then
  echo "KAFKA_BACKGROUND_THREADS: ${KAFKA_BACKGROUND_THREADS}"
  sed -r -i "s|#(background.threads)=.*|\1=${KAFKA_BACKGROUND_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_COMPRESSION_TYPE}" ]; then
  echo "KAFKA_COMPRESSION_TYPE: ${KAFKA_COMPRESSION_TYPE}"
  sed -r -i "s|#(compression.type)=.*|\1=${KAFKA_COMPRESSION_TYPE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_CONNECTIONS_MAX_IDLE_MS}" ]; then
  echo "KAFKA_CONNECTIONS_MAX_IDLE_MS: ${KAFKA_CONNECTIONS_MAX_IDLE_MS}"
  sed -r -i "s|#(connections.max.idle.ms)=.*|\1=${KAFKA_CONNECTIONS_MAX_IDLE_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_CONTROLLED_SHUTDOWN_ENABLE}" ]; then
  echo "KAFKA_CONTROLLED_SHUTDOWN_ENABLE: ${KAFKA_CONTROLLED_SHUTDOWN_ENABLE}"
  sed -r -i "s|#(controlled.shutdown.enable)=.*|\1=${KAFKA_CONTROLLED_SHUTDOWN_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES}" ]; then
  echo "KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES: ${KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES}"
  sed -r -i "s|#(controlled.shutdown.max.retries)=.*|\1=${KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS}" ]; then
  echo "KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS: ${KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS}"
  sed -r -i "s|#(controlled.shutdown.retry.backoff.ms)=.*|\1=${KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS}" ]; then
  echo "KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS: ${KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS}"
  sed -r -i "s|#(controller.socket.timeout.ms)=.*|\1=${KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_DELETE_TOPIC_ENABLE}" ]; then
  echo "KAFKA_DELETE_TOPIC_ENABLE: ${KAFKA_DELETE_TOPIC_ENABLE}"
  sed -r -i "s|#(delete.topic.enable)=.*|\1=${KAFKA_DELETE_TOPIC_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS}" ]; then
  echo "KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS: ${KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS}"
  sed -r -i "s|#(fetch.purgatory.purge.interval.requests)=.*|\1=${KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS}" ]; then
  echo "KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS: ${KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS}"
  sed -r -i "s|#(group.max.session.timeout.ms)=.*|\1=${KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS}" ]; then
  echo "KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS: ${KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS}"
  sed -r -i "s|#(group.min.session.timeout.ms)=.*|\1=${KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_HOST_NAME}" ]; then
  echo "KAFKA_HOST_NAME: ${KAFKA_HOST_NAME}"
  sed -r -i "s|#(host.name)=.*|\1=${KAFKA_HOST_NAME}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_INTER_BROKER_PROTOCOL_VERSION}" ]; then
  echo "KAFKA_INTER_BROKER_PROTOCOL_VERSION: ${KAFKA_INTER_BROKER_PROTOCOL_VERSION}"
  sed -r -i "s|#(inter.broker.protocol.version)=.*|\1=${KAFKA_INTER_BROKER_PROTOCOL_VERSION}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LISTENERS}" ]; then
  echo "KAFKA_LISTENERS: ${KAFKA_LISTENERS}"
  sed -r -i "s|#(listeners)=.*|\1=${KAFKA_LISTENERS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_BACKOFF_MS}" ]; then
  echo "KAFKA_LOG_CLEANER_BACKOFF_MS: ${KAFKA_LOG_CLEANER_BACKOFF_MS}"
  sed -r -i "s|#(log.cleaner.backoff.ms)=.*|\1=${KAFKA_LOG_CLEANER_BACKOFF_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE}" ]; then
  echo "KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE: ${KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE}"
  sed -r -i "s|#(log.cleaner.dedupe.buffer.size)=.*|\1=${KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_DELETE_RETENTION_MS}" ]; then
  echo "KAFKA_LOG_CLEANER_DELETE_RETENTION_MS: ${KAFKA_LOG_CLEANER_DELETE_RETENTION_MS}"
  sed -r -i "s|#(log.cleaner.delete.retention.ms)=.*|\1=${KAFKA_LOG_CLEANER_DELETE_RETENTION_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_ENABLE}" ]; then
  echo "KAFKA_LOG_CLEANER_ENABLE: ${KAFKA_LOG_CLEANER_ENABLE}"
  sed -r -i "s|#(log.cleaner.enable)=.*|\1=${KAFKA_LOG_CLEANER_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_ENABLE}" ]; then
  echo "KAFKA_LOG_CLEANER_ENABLE: ${KAFKA_LOG_CLEANER_ENABLE}"
  sed -r -i "s|#(log.cleaner.enable)=.*|\1=${KAFKA_LOG_CLEANER_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR}" ]; then
  echo "KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR: ${KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR}"
  sed -r -i "s|#(log.cleaner.io.buffer.load.factor)=.*|\1=${KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_IO_BUFFER_SIZE}" ]; then
  echo "KAFKA_LOG_CLEANER_IO_BUFFER_SIZE: ${KAFKA_LOG_CLEANER_IO_BUFFER_SIZE}"
  sed -r -i "s|#(log.cleaner.io.buffer.size)=.*|\1=${KAFKA_LOG_CLEANER_IO_BUFFER_SIZE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND}" ]; then
  echo "KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND: ${KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND}"
  sed -r -i "s|#(log.cleaner.io.max.bytes.per.second)=.*|\1=${KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO}" ]; then
  echo "KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO: ${KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO}"
  sed -r -i "s|#(log.cleaner.min.cleanable.ratio)=.*|\1=${KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANER_THREADS}" ]; then
  echo "KAFKA_LOG_CLEANER_THREADS: ${KAFKA_LOG_CLEANER_THREADS}"
  sed -r -i "s|#(log.cleaner.threads)=.*|\1=${KAFKA_LOG_CLEANER_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_CLEANUP_POLICY}" ]; then
  echo "KAFKA_LOG_CLEANUP_POLICY: ${KAFKA_LOG_CLEANUP_POLICY}"
  sed -r -i "s|#(log.cleanup.policy)=.*|\1=${KAFKA_LOG_CLEANUP_POLICY}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES}" ]; then
  echo "KAFKA_LOG_FLUSH_INTERVAL_MESSAGES: ${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES}"
  sed -r -i "s|#(log.flush.interval.messages)=.*|\1=${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_FLUSH_INTERVAL_MS}" ]; then
  echo "KAFKA_LOG_FLUSH_INTERVAL_MS: ${KAFKA_LOG_FLUSH_INTERVAL_MS}"
  sed -r -i "s|#(log.flush.interval.ms)=.*|\1=${KAFKA_LOG_FLUSH_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS}" ]; then
  echo "KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS: ${KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS}"
  sed -r -i "s|#(log.flush.offset.checkpoint.interval.ms)=.*|\1=${KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS}" ]; then
  echo "KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS: ${KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS}"
  sed -r -i "s|#(log.flush.scheduler.interval.ms)=.*|\1=${KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_INDEX_INTERVAL_BYTES}" ]; then
  echo "KAFKA_LOG_INDEX_INTERVAL_BYTES: ${KAFKA_LOG_INDEX_INTERVAL_BYTES}"
  sed -r -i "s|#(log.index.interval.bytes)=.*|\1=${KAFKA_LOG_INDEX_INTERVAL_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_INDEX_SIZE_MAX_BYTES}" ]; then
  echo "KAFKA_LOG_INDEX_SIZE_MAX_BYTES: ${KAFKA_LOG_INDEX_SIZE_MAX_BYTES}"
  sed -r -i "s|#(log.index.size.max.bytes)=.*|\1=${KAFKA_LOG_INDEX_SIZE_MAX_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_PREALLOCATE}" ]; then
  echo "KAFKA_LOG_PREALLOCATE: ${KAFKA_LOG_PREALLOCATE}"
  sed -r -i "s|#(log.preallocate)=.*|\1=${KAFKA_LOG_PREALLOCATE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_BYTES}" ]; then
  echo "KAFKA_LOG_RETENTION_BYTES: ${KAFKA_LOG_RETENTION_BYTES}"
  sed -r -i "s|#(log.retention.bytes)=.*|\1=${KAFKA_LOG_RETENTION_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}" ]; then
  echo "KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS: ${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}"
  sed -r -i "s|#(log.retention.check.interval.ms)=.*|\1=${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}" ]; then
  echo "KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS: ${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}"
  sed -r -i "s|#(log.retention.check.interval.ms)=.*|\1=${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_HOURS}" ]; then
  echo "KAFKA_LOG_RETENTION_HOURS: ${KAFKA_LOG_RETENTION_HOURS}"
  sed -r -i "s|#(log.retention.hours)=.*|\1=${KAFKA_LOG_RETENTION_HOURS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_HOURS}" ]; then
  echo "KAFKA_LOG_RETENTION_HOURS: ${KAFKA_LOG_RETENTION_HOURS}"
  sed -r -i "s|#(log.retention.hours)=.*|\1=${KAFKA_LOG_RETENTION_HOURS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_MINUTES}" ]; then
  echo "KAFKA_LOG_RETENTION_MINUTES: ${KAFKA_LOG_RETENTION_MINUTES}"
  sed -r -i "s|#(log.retention.minutes)=.*|\1=${KAFKA_LOG_RETENTION_MINUTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_MS}" ]; then
  echo "KAFKA_LOG_RETENTION_MS: ${KAFKA_LOG_RETENTION_MS}"
  sed -r -i "s|#(log.retention.ms)=.*|\1=${KAFKA_LOG_RETENTION_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_ROLL_HOURS}" ]; then
  echo "KAFKA_LOG_ROLL_HOURS: ${KAFKA_LOG_ROLL_HOURS}"
  sed -r -i "s|#(log.roll.hours)=.*|\1=${KAFKA_LOG_ROLL_HOURS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_ROLL_JITTER_HOURS}" ]; then
  echo "KAFKA_LOG_ROLL_JITTER_HOURS: ${KAFKA_LOG_ROLL_JITTER_HOURS}"
  sed -r -i "s|#(log.roll.jitter.hours)=.*|\1=${KAFKA_LOG_ROLL_JITTER_HOURS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_ROLL_JITTER_MS}" ]; then
  echo "KAFKA_LOG_ROLL_JITTER_MS: ${KAFKA_LOG_ROLL_JITTER_MS}"
  sed -r -i "s|#(log.roll.jitter.ms)=.*|\1=${KAFKA_LOG_ROLL_JITTER_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_ROLL_MS}" ]; then
  echo "KAFKA_LOG_ROLL_MS: ${KAFKA_LOG_ROLL_MS}"
  sed -r -i "s|#(log.roll.ms)=.*|\1=${KAFKA_LOG_ROLL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_SEGMENT_BYTES}" ]; then
  echo "KAFKA_LOG_SEGMENT_BYTES: ${KAFKA_LOG_SEGMENT_BYTES}"
  sed -r -i "s|#(log.segment.bytes)=.*|\1=${KAFKA_LOG_SEGMENT_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_SEGMENT_BYTES}" ]; then
  echo "KAFKA_LOG_SEGMENT_BYTES: ${KAFKA_LOG_SEGMENT_BYTES}"
  sed -r -i "s|#(log.segment.bytes)=.*|\1=${KAFKA_LOG_SEGMENT_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_SEGMENT_DELETE_DELAY_MS}" ]; then
  echo "KAFKA_LOG_SEGMENT_DELETE_DELAY_MS: ${KAFKA_LOG_SEGMENT_DELETE_DELAY_MS}"
  sed -r -i "s|#(log.segment.delete.delay.ms)=.*|\1=${KAFKA_LOG_SEGMENT_DELETE_DELAY_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES}" ]; then
  echo "KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES: ${KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES}"
  sed -r -i "s|#(max.connections.per.ip.overrides)=.*|\1=${KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_MAX_CONNECTIONS_PER_IP}" ]; then
  echo "KAFKA_MAX_CONNECTIONS_PER_IP: ${KAFKA_MAX_CONNECTIONS_PER_IP}"
  sed -r -i "s|#(max.connections.per.ip)=.*|\1=${KAFKA_MAX_CONNECTIONS_PER_IP}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_METRIC_REPORTERS}" ]; then
  echo "KAFKA_METRIC_REPORTERS: ${KAFKA_METRIC_REPORTERS}"
  sed -r -i "s|#(metric.reporters)=.*|\1=${KAFKA_METRIC_REPORTERS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_METRICS_NUM_SAMPLES}" ]; then
  echo "KAFKA_METRICS_NUM_SAMPLES: ${KAFKA_METRICS_NUM_SAMPLES}"
  sed -r -i "s|#(metrics.num.samples)=.*|\1=${KAFKA_METRICS_NUM_SAMPLES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_METRICS_SAMPLE_WINDOW_MS}" ]; then
  echo "KAFKA_METRICS_SAMPLE_WINDOW_MS: ${KAFKA_METRICS_SAMPLE_WINDOW_MS}"
  sed -r -i "s|#(metrics.sample.window.ms)=.*|\1=${KAFKA_METRICS_SAMPLE_WINDOW_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_MIN_INSYNC_REPLICAS}" ]; then
  echo "KAFKA_MIN_INSYNC_REPLICAS: ${KAFKA_MIN_INSYNC_REPLICAS}"
  sed -r -i "s|#(min.insync.replicas)=.*|\1=${KAFKA_MIN_INSYNC_REPLICAS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_IO_THREADS}" ]; then
  echo "KAFKA_NUM_IO_THREADS: ${KAFKA_NUM_IO_THREADS}"
  sed -r -i "s|#(num.io.threads)=.*|\1=${KAFKA_NUM_IO_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_IO_THREADS}" ]; then
  echo "KAFKA_NUM_IO_THREADS: ${KAFKA_NUM_IO_THREADS}"
  sed -r -i "s|#(num.io.threads)=.*|\1=${KAFKA_NUM_IO_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_NETWORK_THREADS}" ]; then
  echo "KAFKA_NUM_NETWORK_THREADS: ${KAFKA_NUM_NETWORK_THREADS}"
  sed -r -i "s|#(num.network.threads)=.*|\1=${KAFKA_NUM_NETWORK_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_NETWORK_THREADS}" ]; then
  echo "KAFKA_NUM_NETWORK_THREADS: ${KAFKA_NUM_NETWORK_THREADS}"
  sed -r -i "s|#(num.network.threads)=.*|\1=${KAFKA_NUM_NETWORK_THREADS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_PARTITIONS}" ]; then
  echo "KAFKA_NUM_PARTITIONS: ${KAFKA_NUM_PARTITIONS}"
  sed -r -i "s|#(num.partitions)=.*|\1=${KAFKA_NUM_PARTITIONS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}" ]; then
  echo "KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR: ${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}"
  sed -r -i "s|#(num.recovery.threads.per.data.dir)=.*|\1=${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}" ]; then
  echo "KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR: ${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}"
  sed -r -i "s|#(num.recovery.threads.per.data.dir)=.*|\1=${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_REPLICA_FETCHERS}" ]; then
  echo "KAFKA_NUM_REPLICA_FETCHERS: ${KAFKA_NUM_REPLICA_FETCHERS}"
  sed -r -i "s|#(num.replica.fetchers)=.*|\1=${KAFKA_NUM_REPLICA_FETCHERS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSET_METADATA_MAX_BYTES}" ]; then
  echo "KAFKA_OFFSET_METADATA_MAX_BYTES: ${KAFKA_OFFSET_METADATA_MAX_BYTES}"
  sed -r -i "s|#(offset.metadata.max.bytes)=.*|\1=${KAFKA_OFFSET_METADATA_MAX_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS}" ]; then
  echo "KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS: ${KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS}"
  sed -r -i "s|#(offsets.commit.required.acks)=.*|\1=${KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_COMMIT_TIMEOUT_MS}" ]; then
  echo "KAFKA_OFFSETS_COMMIT_TIMEOUT_MS: ${KAFKA_OFFSETS_COMMIT_TIMEOUT_MS}"
  sed -r -i "s|#(offsets.commit.timeout.ms)=.*|\1=${KAFKA_OFFSETS_COMMIT_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_LOAD_BUFFER_SIZE}" ]; then
  echo "KAFKA_OFFSETS_LOAD_BUFFER_SIZE: ${KAFKA_OFFSETS_LOAD_BUFFER_SIZE}"
  sed -r -i "s|#(offsets.load.buffer.size)=.*|\1=${KAFKA_OFFSETS_LOAD_BUFFER_SIZE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS}" ]; then
  echo "KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS: ${KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS}"
  sed -r -i "s|#(offsets.retention.check.interval.ms)=.*|\1=${KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_RETENTION_MINUTES}" ]; then
  echo "KAFKA_OFFSETS_RETENTION_MINUTES: ${KAFKA_OFFSETS_RETENTION_MINUTES}"
  sed -r -i "s|#(offsets.retention.minutes)=.*|\1=${KAFKA_OFFSETS_RETENTION_MINUTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC}" ]; then
  echo "KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC: ${KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC}"
  sed -r -i "s|#(offsets.topic.compression.codec)=.*|\1=${KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS}" ]; then
  echo "KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS: ${KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS}"
  sed -r -i "s|#(offsets.topic.num.partitions)=.*|\1=${KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR}" ]; then
  echo "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: ${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR}"
  sed -r -i "s|#(offsets.topic.replication.factor)=.*|\1=${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES}" ]; then
  echo "KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES: ${KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES}"
  sed -r -i "s|#(offsets.topic.segment.bytes)=.*|\1=${KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_PRINCIPAL_BUILDER_CLASS}" ]; then
  echo "KAFKA_PRINCIPAL_BUILDER_CLASS: ${KAFKA_PRINCIPAL_BUILDER_CLASS}"
  sed -r -i "s|#(principal.builder.class)=.*|\1=${KAFKA_PRINCIPAL_BUILDER_CLASS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS}" ]; then
  echo "KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS: ${KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS}"
  sed -r -i "s|#(producer.purgatory.purge.interval.requests)=.*|\1=${KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_QUEUED_MAX_REQUESTS}" ]; then
  echo "KAFKA_QUEUED_MAX_REQUESTS: ${KAFKA_QUEUED_MAX_REQUESTS}"
  sed -r -i "s|#(queued.max.requests)=.*|\1=${KAFKA_QUEUED_MAX_REQUESTS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_QUOTA_CONSUMER_DEFAULT}" ]; then
  echo "KAFKA_QUOTA_CONSUMER_DEFAULT: ${KAFKA_QUOTA_CONSUMER_DEFAULT}"
  sed -r -i "s|#(quota.consumer.default)=.*|\1=${KAFKA_QUOTA_CONSUMER_DEFAULT}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_QUOTA_PRODUCER_DEFAULT}" ]; then
  echo "KAFKA_QUOTA_PRODUCER_DEFAULT: ${KAFKA_QUOTA_PRODUCER_DEFAULT}"
  sed -r -i "s|#(quota.producer.default)=.*|\1=${KAFKA_QUOTA_PRODUCER_DEFAULT}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_QUOTA_WINDOW_NUM}" ]; then
  echo "KAFKA_QUOTA_WINDOW_NUM: ${KAFKA_QUOTA_WINDOW_NUM}"
  sed -r -i "s|#(quota.window.num)=.*|\1=${KAFKA_QUOTA_WINDOW_NUM}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_QUOTA_WINDOW_SIZE_SECONDS}" ]; then
  echo "KAFKA_QUOTA_WINDOW_SIZE_SECONDS: ${KAFKA_QUOTA_WINDOW_SIZE_SECONDS}"
  sed -r -i "s|#(quota.window.size.seconds)=.*|\1=${KAFKA_QUOTA_WINDOW_SIZE_SECONDS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_FETCH_BACKOFF_MS}" ]; then
  echo "KAFKA_REPLICA_FETCH_BACKOFF_MS: ${KAFKA_REPLICA_FETCH_BACKOFF_MS}"
  sed -r -i "s|#(replica.fetch.backoff.ms)=.*|\1=${KAFKA_REPLICA_FETCH_BACKOFF_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_FETCH_MIN_BYTES}" ]; then
  echo "KAFKA_REPLICA_FETCH_MIN_BYTES: ${KAFKA_REPLICA_FETCH_MIN_BYTES}"
  sed -r -i "s|#(replica.fetch.min.bytes)=.*|\1=${KAFKA_REPLICA_FETCH_MIN_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_FETCH_WAIT_MAX_MS}" ]; then
  echo "KAFKA_REPLICA_FETCH_WAIT_MAX_MS: ${KAFKA_REPLICA_FETCH_WAIT_MAX_MS}"
  sed -r -i "s|#(replica.fetch.wait.max.ms)=.*|\1=${KAFKA_REPLICA_FETCH_WAIT_MAX_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS}" ]; then
  echo "KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS: ${KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS}"
  sed -r -i "s|#(replica.high.watermark.checkpoint.interval.ms)=.*|\1=${KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_LAG_TIME_MAX_MS}" ]; then
  echo "KAFKA_REPLICA_LAG_TIME_MAX_MS: ${KAFKA_REPLICA_LAG_TIME_MAX_MS}"
  sed -r -i "s|#(replica.lag.time.max.ms)=.*|\1=${KAFKA_REPLICA_LAG_TIME_MAX_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES}" ]; then
  echo "KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES: ${KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES}"
  sed -r -i "s|#(replica.socket.receive.buffer.bytes)=.*|\1=${KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REPLICA_SOCKET_TIMEOUT_MS}" ]; then
  echo "KAFKA_REPLICA_SOCKET_TIMEOUT_MS: ${KAFKA_REPLICA_SOCKET_TIMEOUT_MS}"
  sed -r -i "s|#(replica.socket.timeout.ms)=.*|\1=${KAFKA_REPLICA_SOCKET_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_REQUEST_TIMEOUT_MS}" ]; then
  echo "KAFKA_REQUEST_TIMEOUT_MS: ${KAFKA_REQUEST_TIMEOUT_MS}"
  sed -r -i "s|#(request.timeout.ms)=.*|\1=${KAFKA_REQUEST_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_RESERVED_BROKER_MAX_ID}" ]; then
  echo "KAFKA_RESERVED_BROKER_MAX_ID: ${KAFKA_RESERVED_BROKER_MAX_ID}"
  sed -r -i "s|#(reserved.broker.max.id)=.*|\1=${KAFKA_RESERVED_BROKER_MAX_ID}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_KINIT_CMD}" ]; then
  echo "KAFKA_SASL_KERBEROS_KINIT_CMD: ${KAFKA_SASL_KERBEROS_KINIT_CMD}"
  sed -r -i "s|#(sasl.kerberos.kinit.cmd)=.*|\1=${KAFKA_SASL_KERBEROS_KINIT_CMD}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN}" ]; then
  echo "KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN: ${KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN}"
  sed -r -i "s|#(sasl.kerberos.min.time.before.relogin)=.*|\1=${KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES}" ]; then
  echo "KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES: ${KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES}"
  sed -r -i "s|#(sasl.kerberos.principal.to.local.rules)=.*|\1=${KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_SERVICE_NAME}" ]; then
  echo "KAFKA_SASL_KERBEROS_SERVICE_NAME: ${KAFKA_SASL_KERBEROS_SERVICE_NAME}"
  sed -r -i "s|#(sasl.kerberos.service.name)=.*|\1=${KAFKA_SASL_KERBEROS_SERVICE_NAME}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER}" ]; then
  echo "KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER: ${KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER}"
  sed -r -i "s|#(sasl.kerberos.ticket.renew.jitter)=.*|\1=${KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR}" ]; then
  echo "KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR: ${KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR}"
  sed -r -i "s|#(sasl.kerberos.ticket.renew.window.factor)=.*|\1=${KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SECURITY_INTER_BROKER_PROTOCOL}" ]; then
  echo "KAFKA_SECURITY_INTER_BROKER_PROTOCOL: ${KAFKA_SECURITY_INTER_BROKER_PROTOCOL}"
  sed -r -i "s|#(security.inter.broker.protocol)=.*|\1=${KAFKA_SECURITY_INTER_BROKER_PROTOCOL}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}" ]; then
  echo "KAFKA_SOCKET_RECEIVE_BUFFER_BYTES: ${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}"
  sed -r -i "s|#(socket.receive.buffer.bytes)=.*|\1=${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}" ]; then
  echo "KAFKA_SOCKET_RECEIVE_BUFFER_BYTES: ${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}"
  sed -r -i "s|#(socket.receive.buffer.bytes)=.*|\1=${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_REQUEST_MAX_BYTES}" ]; then
  echo "KAFKA_SOCKET_REQUEST_MAX_BYTES: ${KAFKA_SOCKET_REQUEST_MAX_BYTES}"
  sed -r -i "s|#(socket.request.max.bytes)=.*|\1=${KAFKA_SOCKET_REQUEST_MAX_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_REQUEST_MAX_BYTES}" ]; then
  echo "KAFKA_SOCKET_REQUEST_MAX_BYTES: ${KAFKA_SOCKET_REQUEST_MAX_BYTES}"
  sed -r -i "s|#(socket.request.max.bytes)=.*|\1=${KAFKA_SOCKET_REQUEST_MAX_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_SEND_BUFFER_BYTES}" ]; then
  echo "KAFKA_SOCKET_SEND_BUFFER_BYTES: ${KAFKA_SOCKET_SEND_BUFFER_BYTES}"
  sed -r -i "s|#(socket.send.buffer.bytes)=.*|\1=${KAFKA_SOCKET_SEND_BUFFER_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SOCKET_SEND_BUFFER_BYTES}" ]; then
  echo "KAFKA_SOCKET_SEND_BUFFER_BYTES: ${KAFKA_SOCKET_SEND_BUFFER_BYTES}"
  sed -r -i "s|#(socket.send.buffer.bytes)=.*|\1=${KAFKA_SOCKET_SEND_BUFFER_BYTES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_CIPHER_SUITES}" ]; then
  echo "KAFKA_SSL_CIPHER_SUITES: ${KAFKA_SSL_CIPHER_SUITES}"
  sed -r -i "s|#(ssl.cipher.suites)=.*|\1=${KAFKA_SSL_CIPHER_SUITES}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_CLIENT_AUTH}" ]; then
  echo "KAFKA_SSL_CLIENT_AUTH: ${KAFKA_SSL_CLIENT_AUTH}"
  sed -r -i "s|#(ssl.client.auth)=.*|\1=${KAFKA_SSL_CLIENT_AUTH}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_ENABLED_PROTOCOLS}" ]; then
  echo "KAFKA_SSL_ENABLED_PROTOCOLS: ${KAFKA_SSL_ENABLED_PROTOCOLS}"
  sed -r -i "s|#(ssl.enabled.protocols)=.*|\1=${KAFKA_SSL_ENABLED_PROTOCOLS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM}" ]; then
  echo "KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM: ${KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM}"
  sed -r -i "s|#(ssl.endpoint.identification.algorithm)=.*|\1=${KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_KEY_PASSWORD}" ]; then
  echo "KAFKA_SSL_KEY_PASSWORD: ${KAFKA_SSL_KEY_PASSWORD}"
  sed -r -i "s|#(ssl.key.password)=.*|\1=${KAFKA_SSL_KEY_PASSWORD}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_KEYMANAGER_ALGORITHM}" ]; then
  echo "KAFKA_SSL_KEYMANAGER_ALGORITHM: ${KAFKA_SSL_KEYMANAGER_ALGORITHM}"
  sed -r -i "s|#(ssl.keymanager.algorithm)=.*|\1=${KAFKA_SSL_KEYMANAGER_ALGORITHM}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_KEYSTORE_LOCATION}" ]; then
  echo "KAFKA_SSL_KEYSTORE_LOCATION: ${KAFKA_SSL_KEYSTORE_LOCATION}"
  sed -r -i "s|#(ssl.keystore.location)=.*|\1=${KAFKA_SSL_KEYSTORE_LOCATION}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_KEYSTORE_PASSWORD}" ]; then
  echo "KAFKA_SSL_KEYSTORE_PASSWORD: ${KAFKA_SSL_KEYSTORE_PASSWORD}"
  sed -r -i "s|#(ssl.keystore.password)=.*|\1=${KAFKA_SSL_KEYSTORE_PASSWORD}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_KEYSTORE_TYPE}" ]; then
  echo "KAFKA_SSL_KEYSTORE_TYPE: ${KAFKA_SSL_KEYSTORE_TYPE}"
  sed -r -i "s|#(ssl.keystore.type)=.*|\1=${KAFKA_SSL_KEYSTORE_TYPE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_PROTOCOL}" ]; then
  echo "KAFKA_SSL_PROTOCOL: ${KAFKA_SSL_PROTOCOL}"
  sed -r -i "s|#(ssl.protocol)=.*|\1=${KAFKA_SSL_PROTOCOL}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_PROVIDER}" ]; then
  echo "KAFKA_SSL_PROVIDER: ${KAFKA_SSL_PROVIDER}"
  sed -r -i "s|#(ssl.provider)=.*|\1=${KAFKA_SSL_PROVIDER}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_TRUSTMANAGER_ALGORITHM}" ]; then
  echo "KAFKA_SSL_TRUSTMANAGER_ALGORITHM: ${KAFKA_SSL_TRUSTMANAGER_ALGORITHM}"
  sed -r -i "s|#(ssl.trustmanager.algorithm)=.*|\1=${KAFKA_SSL_TRUSTMANAGER_ALGORITHM}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_TRUSTSTORE_LOCATION}" ]; then
  echo "KAFKA_SSL_TRUSTSTORE_LOCATION: ${KAFKA_SSL_TRUSTSTORE_LOCATION}"
  sed -r -i "s|#(ssl.truststore.location)=.*|\1=${KAFKA_SSL_TRUSTSTORE_LOCATION}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_TRUSTSTORE_PASSWORD}" ]; then
  echo "KAFKA_SSL_TRUSTSTORE_PASSWORD: ${KAFKA_SSL_TRUSTSTORE_PASSWORD}"
  sed -r -i "s|#(ssl.truststore.password)=.*|\1=${KAFKA_SSL_TRUSTSTORE_PASSWORD}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_SSL_TRUSTSTORE_TYPE}" ]; then
  echo "KAFKA_SSL_TRUSTSTORE_TYPE: ${KAFKA_SSL_TRUSTSTORE_TYPE}"
  sed -r -i "s|#(ssl.truststore.type)=.*|\1=${KAFKA_SSL_TRUSTSTORE_TYPE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE}" ]; then
  echo "KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE: ${KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE}"
  sed -r -i "s|#(unclean.leader.election.enable)=.*|\1=${KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS}" ]; then
  echo "KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS: ${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS}"
  sed -r -i "s|#(zookeeper.connection.timeout.ms)=.*|\1=${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS}" ]; then
  echo "KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS: ${KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS}"
  sed -r -i "s|#(zookeeper.session.timeout.ms)=.*|\1=${KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZOOKEEPER_SET_ACL}" ]; then
  echo "KAFKA_ZOOKEEPER_SET_ACL: ${KAFKA_ZOOKEEPER_SET_ACL}"
  sed -r -i "s|#(zookeeper.set.acl)=.*|\1=${KAFKA_ZOOKEEPER_SET_ACL}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZOOKEEPER_SYNC_TIME_MS}" ]; then
  echo "KAFKA_ZOOKEEPER_SYNC_TIME_MS: ${KAFKA_ZOOKEEPER_SYNC_TIME_MS}"
  sed -r -i "s|#(zookeeper.sync.time.ms)=.*|\1=${KAFKA_ZOOKEEPER_SYNC_TIME_MS}|g" /kafka/config/server.properties
fi

echo "==== START /kafka/config/server.properties ===="
cat /kafka/config/server.properties
echo "==== END /kafka/config/server.properties ===="

CMD="/kafka/bin/kafka-server-start.sh /kafka/config/server.properties"

echo "Starting Kafka [${KAFKA_VERSION}] using command [${CMD}]"
$CMD
