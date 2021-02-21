#!/usr/bin/env bash

/usr/bin/optimus-manager --no-confirm --switch nvidia
sudo /usr/bin/prime-switch
/usr/bin/sleep 4
/usr/bin/startx
