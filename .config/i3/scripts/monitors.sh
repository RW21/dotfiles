#!/bin/zsh

where=$1

if [[ "$where" == "home" ]] ;then
	xrandr --output HDMI-A-0 --auto --right-of eDP
	xrandr --output DisplayPort-0 --auto --right-of HDMI-A-0
else
	xrandr --output HDMI-A-0 --off
	xrandr --output DisplayPort-0 --off
fi
