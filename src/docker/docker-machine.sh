#!/bin/bash
# This features helpful commands for docker-machine

function create-machine {
    docker-machine create -d virtualbox --virtualbox-disk-size "60000" --virtualbox-memory "6144" --virtualbox-cpu-count "2" $1
}

function use-machine {
    eval "$(docker-machine env $1)"
}

function use-default {
    use-machine default
}

function start-machine {
    docker-machine start $1
}

function start-default {
    start-machine default
}

function stop-machine {
    docker-machine stop $1
}

function stop-default {
    stop-machine default
}

function unset-docker {
    unset ${!DOCKER_*}
}

alias docker-ssh="docker-machine ssh default"
