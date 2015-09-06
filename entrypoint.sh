#!/bin/sh

# KAFKA_BROKER_ID / broker.id
# port 9092
# KAFKA_HOSTNAME / #host.name (bind to hostname, default is all interfaces)
# KAFKA_ADVERTISED_HOST_NAME / #advertised.host.name
# KAFKA_ADVERTISED_PORT / #advertised.port
# KAFKA_LOG_DIRS / log.dirs
# KAFKA_NUM_PARTITIONS / num.partitions (default num partitions)
# KAFKA_LOG_RETENTION_HOURS / log.retention.hours
# KAFKA_LOG_RETENTION_BYTES / log.retention.bytes-+
# KAFKA_ZK_CONNECT / zookeeper.connect


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

if [ ! -z "${KAFKA_BROKER_ID}" ]; then
    echo "KAFKA_BROKER_ID: ${KAFKA_BROKER_ID}"
    sed -r -i "s/(broker\.id)=.*/\1=${KAFKA_BROKER_ID}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_HOSTNAME}" ]; then
    echo "KAFKA_HOSTNAME: ${KAFKA_HOSTNAME}"
    sed -r -i "s/#(host\.name)=.*/\1=${KAFKA_HOSTNAME}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ADVERTISED_HOST_NAME}" ]; then
    echo "KAFKA_ADVERTISED_HOST_NAME: ${KAFKA_ADVERTISED_HOST_NAME}"
    sed -r -i "s/#(advertised\.host\.name)=.*/\1=${KAFKA_ADVERTISED_HOST_NAME}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ADVERTISED_PORT}" ]; then
    echo "KAFKA_ADVERTISED_HOST_NAME: ${KAFKA_ADVERTISED_PORT}"
    sed -r -i "s/#(advertised\.port)=.*/\1=${KAFKA_ADVERTISED_PORT}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_DIRS}" ]; then
    echo "KAFKA_LOG_DIRS: ${KAFKA_LOG_DIRS}"
    sed -r -i "s|(log\.dirs)=.*|\1=${KAFKA_LOG_DIRS}|g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_NUM_PARTITIONS}" ]; then
    echo "KAFKA_NUM_PARTITIONS: ${KAFKA_NUM_PARTITIONS}"
    sed -r -i "s/(num\.partitions)=.*/\1=${KAFKA_NUM_PARTITIONS}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_HOURS}" ]; then
    echo "KAFKA_LOG_RETENTION_HOURS: ${KAFKA_LOG_RETENTION_HOURS}"
    sed -r -i "s/(log\.retention\.hours)=.*/\1=${KAFKA_LOG_RETENTION_HOURS}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_LOG_RETENTION_BYTES}" ]; then
    echo "KAFKA_LOG_RETENTION_BYTES: ${KAFKA_LOG_RETENTION_BYTES}"
    sed -r -i "s/(log\.retention\.bytes)=.*/\1=${KAFKA_LOG_RETENTION_BYTES}/g" /kafka/config/server.properties
fi

if [ ! -z "${KAFKA_ZK_CONNECT}" ]; then
    echo "KAFKA_ZK_CONNECT: ${KAFKA_ZK_CONNECT}"
    sed -r -i "s/(zookeeper\.connect)=.*/\1=${KAFKA_ZK_CONNECT}/g" /kafka/config/server.properties
fi

echo "==== START /kafka/config/server.properties ===="
cat /kafka/config/server.properties
echo "==== END /kafka/config/server.properties ===="

CMD="/kafka/bin/kafka-server-start.sh /kafka/config/server.properties"

echo "Starting Kafka [${KAFKA_VERSION}] using command [${CMD}]"
$CMD
