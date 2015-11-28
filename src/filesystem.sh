#!/bin/bash
# Operations that alter the filesystem
# layout in any significant way such 
# as mounting a remove volume over ssh

# Required: 
#   - brew install Caskroom/cask/osxfuse
#   - brew install homebrew/fuse/sshfs
# args
#   $1 - host name that you want to ssh to
#   $2 - drive to mount to on remote machine
#   $3 - drive to mount to on local machine (relative to /mnt)
function osx-mount-ssh() {
    mkdir -p ~/Mounts/$3
    sshfs $1:$2 ~/Mounts/$3 -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache
}

# rsync `daemon`
# Optional:
#  - brew install homebrew/dupes/rsync
# args
#   $1 - host name that you want to ssh to
#   $2 - drive to mount to on remote machine
#   $3 - drive to mount to on local machine (relative to /mnt)
function osx-rsync-ssh() {
    mkdir -p ~/Mounts/$3
    rsync -az $1:$2/ ~/Mounts/$3
    while [ true ]
    do
      rsync -cia --delete ~/Mounts/$3/ $1:$2
      sleep 1
    done
}
