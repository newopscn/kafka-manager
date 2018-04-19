#!/bin/bash

cd $(dirname $0)

bin/kafka-manager \
    -Dconfig.file=./conf/application.conf \
    -Dhttp.port=${KM_PORT:-"18083"} \
    -DZK_HOSTS=${ZK_HOSTS:-"localhost:2181"} \
    -DKAFKA_MANAGER_AUTH_ENABLED="true" \
    -DKAFKA_MANAGER_USERNAME=${KM_USER:-"admin"} \
    -DKAFKA_MANAGER_PASSWORD=${KM_PASS:-"1234@qwer"}
