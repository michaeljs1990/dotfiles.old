#!/bin/bash
# This features helpful commands for docker

function docker-clean {
    docker rm -v $(docker ps -a -q -f status=exited)
    docker rmi $(docker images -f "dangling=true" -q)
}

function docker-clean-all {
    docker rm -f $(docker ps -a -q)
    docker rmi -f $(docker images -q)
}

function docker-rm {
    docker-compose rm $1
}

alias docker-up="docker-compose up -d"
alias docker-build="docker-compose build"
alias docker-stop="docker-compose stop"

function dssh() {
    docker exec -it $1 /bin/bash
}

function dlog() {
    docker logs -f $1
}
