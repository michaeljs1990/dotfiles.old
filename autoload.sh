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

# Load all private bash files
for PFILE in ${DOTFILES_DIR}/private/*
do
    FILE_NAME=$(basename ${PFILE})
    if [ -f $PFILE ]
    then
        echo "sourcing $FILE_NAME"
        source $PFILE
    fi
done

# Load all standard files
for SFILE in ${DOTFILES_DIR}/src/*
do
    FILE_NAME=$(basename ${SFILE})
    if [ -f $SFILE  ]
    then
        echo "sourcing $(basename ${SFILE})"
        source $SFILE
    fi
done
