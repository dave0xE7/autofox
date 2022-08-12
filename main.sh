#!/usr/bin/env bash

PIDS=""

_DISPLAY=:99

function Start() {
	Xvfb -screen 0 1028x800x24 $_DISPLAY &>/dev/null &
	PIDS="$PIDS $!"
	echo $PIDS
	sleep 1
	
	x11vnc -display $_DISPLAY -nopw -localhost -forever &>/dev/null &
	PIDS="$PIDS $!"
	echo $PIDS
	sleep 2
	
	ssvncviewer localhost:5900 -scale 0.5 &>/dev/null &
	PIDS="$PIDS $!"
	echo $PIDS
	
	marco &>/dev/null &
	PIDS="$PIDS $!"
	echo $PIDS

	sleep 1

	firefox --display=$_DISPLAY --profile firefox.profile &>/dev/null &
	PIDS="$PIDS $!"
	echo $PIDS
}


#xte ""

# Exit event handler
function on_exit() {
	tput cnorm # Show cursor. You need this if animation is used.
	# i.e. clean-up code here
	for item in $PIDS; do
		echo "PID: ${item}"
		kill $item
	done
	
	exit 0 # Exit gracefully.
}

Start

read -p 'ready?' a

# Put this line at the beginning of your script (after functions used by event handlers).
# Register exit event handler.
trap on_exit EXIT
