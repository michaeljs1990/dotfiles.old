#!/bin/bash
# This features helpful commands
# for docker and docker-machine


function use-machine {
    eval "$(docker-machine env $1)"
}

function docker-clean {
    docker rm -f $(docker ps -a -q)
    docker rmi -f $(docker images -q)
}
