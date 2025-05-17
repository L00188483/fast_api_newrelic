#!/bin/bash

CONTAINER_NAME="fastapi_container"
INI_PATH=$(readlink -f ./newrelic.ini)

if [ ! -f $INI_PATH ]; then
    echo "newrelic.ini not found at: $INI_PATH"
    exit 1
fi


docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker build -t fastapi .

docker run --rm --name $CONTAINER_NAME -p 8080:8080 -v "$INI_PATH:/code/newrelic.ini" fastapi
