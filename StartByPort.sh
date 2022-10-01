#!/usr/bin/env bash

for id in $(docker ps -aq)
do
    if [[ $(docker port "${id}") == *"${1}"* ]]; then
        echo "Getting into container ${id}"
        docker exec -it "${id}" bash
        cd "/var/jenkins_home/workspace/NodeJS Pipeline"
        npm start&
    fi
done
