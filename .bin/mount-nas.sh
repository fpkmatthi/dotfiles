#!/bin/dash

# TODO: check if already mounted
# TODO: parse more than 1 parameter
# TODO: implement unmount
case $1 in
  plex)
    sudo mount matthinas:/volume1/Plex /mnt/matthinas
    ;;
  # iso)
  #   sudo mount matthinas:/volume1/iso /mnt/MatthiNas
  #   ;;
  *)
    echo "NFS share not found"
esac
