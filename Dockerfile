FROM java:8-jdk
MAINTAINER Alex Sherwin <alex.sherwin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.9.0.0

ADD entrypoint.sh /entrypoint.sh

RUN wget -q http://apache.cs.utah.edu/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C / && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    mv /kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" /kafka && \
    chmod +x /entrypoint.sh && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

# Forces DNS resolution before /etc/hosts
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf

ADD server.properties /kafka/config/server.properties

EXPOSE 9092

CMD ["/entrypoint.sh"]
