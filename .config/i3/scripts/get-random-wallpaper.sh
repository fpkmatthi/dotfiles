#!/bin/dash

set -- $HOME/Pictures/Wal/*
n=$(echo $# | awk '{srand(); print int(rand()*$0) + 1}')
eval "file=\$$n"
echo "$file"
