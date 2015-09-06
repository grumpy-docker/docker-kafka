FROM java:8-jre
MAINTAINER Alex Sherwin <alex.sherwin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.8.2.1

# Install Kafka, Zookeeper and other needed things
#RUN apt-get update && \
#    apt-get install -y zookeeper wget supervisor dnsutils && \
#    rm -rf /var/lib/apt/lists/* && \
#    apt-get clean

ADD entrypoint.sh /entrypoint.sh

RUN wget -q http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C / && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    mv /kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" /kafka && \
    chmod +x /entrypoint.sh

#ADD scripts/start-kafka.sh /usr/bin/start-kafka.sh


# 2181 is zookeeper, 9092 is kafka
EXPOSE 2181 9092

CMD ["/entrypoint.sh"]
