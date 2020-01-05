#!/bin/bash

# xfce4-terminal spawner with hacky profile support
#
# Use this to spawn a shell if you want different colorschemes
# for each xfce4-terminal instance. See "colo" colorswitcher script

XDG_CONFIG_HOME=/tmp/xfce4-terminal-$(date +%H-%M-%S-%N)
mkdir $XDG_CONFIG_HOME
cp -r ~/.config/xfce4 $XDG_CONFIG_HOME/
export XDG_CONFIG_HOME=$XDG_CONFIG_HOME
xfce4-terminal --disable-server 2>/dev/null &
