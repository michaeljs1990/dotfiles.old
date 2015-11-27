#!/bin/bash
# functions to make it easier to work with git

function git-user() {
    COMMAND="git config --global user.email"

    case $1 in
        work ) eval "${COMMAND} ${GIT_WORK_USER}";;
        home ) eval "${COMMAND} ${GIT_HOME_USER}";;
    esac
}
