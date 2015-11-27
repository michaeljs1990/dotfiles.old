#!/bin/bash
# This file is loaded every time a new
# terminal is opened things in this
# file can't be dependent on a relative
# path or you will see errors when you
# open your terminal. Source this file
# in your .bashrc or .bash_profile with
#
# `source dotfiles/autoload.sh`
#
# using ./ will not work as changes run
# inside this script will then be discarded

# Always get the directory that this script is set in
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check flag for verbose output
DOTFILE_VERBOSE=false
while (( "$#" )); do
  case "$1" in
    -v | --verbose ) DOTFILE_VERBOSE=true;;
  esac
  shift
done

# Source entire directory in alphanumeric order
# args
#   $1 - (string) directory to be autoloaded without trailing /
#   $2 - (bool) verbose
function autoload-directory() {
    for ALFILE in ${1}/*.sh
    do
        FILE_NAME=$(basename ${ALFILE})
        if [ -f $ALFILE ]
        then
            if [ "$2" = true ]
            then
                echo "sourcing $FILE_NAME"
            fi
            source $ALFILE
        fi
    done
}

autoload-directory "${DOTFILES_DIR}/private" $DOTFILE_VERBOSE
autoload-directory "${DOTFILES_DIR}/src" $DOTFILE_VERBOSE
