#!/bin/bash

#kitty -e unimatrix &
#sleep .5
#i3-msg fullscreen

kitty --start-as fullscreen -e unimatrix -afo &


sleep 1

i3lock -nc000000; kill %1
