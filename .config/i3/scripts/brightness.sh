#!/bin/zsh

direction=$1
value=$2
dir="/sys/class/backlight/amdgpu_bl0/brightness"
echo $direction
if [[ "$direction" == "plus" ]] ;then
	to=$(awk '{print $1+var}' var="$value" $dir)
else
	to=$(awk '{print $1-var}' var="$value" $dir)
fi
echo $to > $dir

