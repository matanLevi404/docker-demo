#!/usr/bin/env bash

for id in $(docker ps -aq)
do
    REG='^${1}[^0-9]*'
    if [[ $(docker port "${id}") =~ $REG ]]; then
        echo "stopping container ${id}"
        docker stop "${id}"
        docker rm "${id}"
    fi
done
