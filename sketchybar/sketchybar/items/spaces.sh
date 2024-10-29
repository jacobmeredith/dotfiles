#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9") 

sketchybar --add event aerospace_workspace_change

for sid in ${SPACE_ICONS[*]} ; do
    space=(
        icon=$sid
        icon.padding_left=10
        icon.padding_right=10
        padding_left=2
        padding_right=2
        label.padding_right=20
        icon.highlight_color=$RED
        label.color=$GREY
        label.highlight_color=$WHITE
        label.font="sketchybar-app-font:Regular:16.0"
        label.y_offset=-1
        background.color=$BACKGROUND_1
        background.border_color=$BACKGROUND_2
        background.drawing=off
        label.drawing=off
        click_script="aerospace workspace $sid"
        script="$PLUGIN_DIR/space.sh $sid"
    )

    sketchybar --add item aerospace.$sid left \
               --set aerospace.$sid "${space[@]}" \
               --subscribe aerospace.$sid aerospace_workspace_change
 done

