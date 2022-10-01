#!/usr/bin/env bash

for id in $(docker ps -aq)
do
    if [[ $(docker port "${id}") == *"${1}"* ]]; then
        echo "stopping container ${id}"
        docker stop "${id}"
        docker rm "${id}"
    fi
done
