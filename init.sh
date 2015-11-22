#!/bin/bash 
# init.sh is a file for placing commands
# that should not be run on shell start
# but only need to be run once to configure
# the system. The file must be run from
# the directory that it is placed in.

# Global git ignores
git config --global core.excludesfile `pwd`/.gitignore_global
