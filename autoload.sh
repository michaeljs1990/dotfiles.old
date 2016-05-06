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

ALLOWED_DIR=("private" "src")

# Source entire directory in alphanumeric order
# args
#   $1 - (string) directory to be autoloaded without trailing /
function autoload-directory() {
  for FILE in $1/*
  do
    FILE_NAME=$(basename ${FILE})
    if [ -f $FILE ]
    then
      if [ "$DOTFILE_VERBOSE" = true ]
      then
        echo "sourcing $FILE_NAME"
      fi
      source $FILE
    elif [ -d $FILE ]
    then
      # autoload files in sub dir
      autoload-directory "$FILE"
    fi
  done
}

# Ease of use function for reloading
function reload-dotfiles() {
    source ~/.bash_profile
}

for DIR in "${ALLOWED_DIR[@]}"
do
  autoload-directory "${DOTFILES_DIR}/$DIR"
done
