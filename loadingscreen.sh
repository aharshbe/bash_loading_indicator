#!/bin/bash

: '
	This is a script which creates a loading
	screen in the center of a terminal window
	of size 120x50 in order to emulate the 
	progress of an intstalltion for software 
	or another script.

	** vertical and horizontal spacing can be
	modified to accomodate a difference size 
	terminal window

	Created by Austin Harshberger
	09-17-2018
'

# Function to format verticle space
# (for centering the prompt on the screen)
formatting_space_verticle()
{
	until [[ $i -gt 25 ]]
	do
		echo ""
		i=$((i+1))
	done
	i=0
}

# Function to format horozontal space
# (for centering the prompt on the screen)
formatting_space_horozonal()
{
	echo -n "                                                 "
}

# Variables
var=0
i=0
dot='.'
dot_num=0

# Change this variable to alter speed of loading
speed_of_loading=.18

until [ $var -gt 100 ]
do
	formatting_space_verticle
	formatting_space_horozonal
	echo $var"% complete. Loading"$dot
	sleep $speed_of_loading
	var=$((var+1))
	if [[ $dot_num -lt 4 ]]; then
		dot_num=$((dot_num+1))
		dot+='.'
	else
		dot_num=0
		dot='.'
	fi
	clear
done

formatting_space_verticle
formatting_space_horozonal
echo "Loading complete."

sleep 3
clear

# end of script