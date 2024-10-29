#!/bin/bash


echo "Active spaces $1" >> ~/workspace_log.txt

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.highlight=on \
                 label.highlight=on \
                 background.border_color=0xff939ab7
else
    sketchybar --set $NAME icon.highlight=off \
                 label.highlight=off \
                 background.border_color=0x60494d64
fi

