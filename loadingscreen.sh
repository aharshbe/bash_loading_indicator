#!/bin/bash

: '
	This is a script which creates a Loading
	screen in the cernter of a terminal in order
	to emulate the progress of an intstalltion of
	software or another script

	Created by Austin Harshberger
	09-17-2018
'

formatting_space_verticle()
{
	until [[ $i -gt 25 ]]
	do
		echo ""
		i=$((i+1))
	done
	i=0
}

formatting_space_horozonal()
{
	echo -n "                                                 "
}

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