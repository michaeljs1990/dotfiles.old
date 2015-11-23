#!/bin/bash
# This features helpful commands
# for docker and docker-machine


function use-machine {
    eval "$(docker-machine env $1)"
}
