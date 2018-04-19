FROM openjdk:8-jdk

ARG KM_VERSION=1.3.3.17

WORKDIR /opt

COPY kafka-manager-${KM_VERSION}.zip .

RUN unzip -d . kafka-manager-${KM_VERSION}.zip && \
    mv /opt/kafka-manager-${KM_VERSION} /tmp/kafka-manager

FROM confluentinc/cp-base

COPY --from=0 /tmp/kafka-manager /opt/kafka-manager

WORKDIR /opt/kafka-manager
COPY kafka_manager.sh .

CMD [ "./kafka_manager.sh" ]
