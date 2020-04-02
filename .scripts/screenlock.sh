#!/bin/bash

#kitty -e unimatrix &
#sleep .5
#i3-msg fullscreen

#c_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

#i3-msg 'workspace 99; exec kitty --start-as fullscreen -e unimatrix -o &'
kitty --start-as fullscreen -e unimatrix -o

#sleep 1

#kitty -e unimatrix -o &

#sleep 1

#i3-msg fullscreen

#sleep 1

#i3lock -nc000000; i3-msg kill; i3-msg 'workspace' $c_ws
