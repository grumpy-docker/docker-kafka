FROM java:8-jre
MAINTAINER Alex Sherwin <alex.sherwin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.8.2.1

ADD entrypoint.sh /entrypoint.sh

RUN wget -q http://apache.cs.utah.edu//kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C / && \
    rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv /kafka_${SCALA_VERSION}-${KAFKA_VERSION} /kafka && \
    chmod +x /entrypoint.sh

EXPOSE 9092

CMD ["/entrypoint.sh"]
