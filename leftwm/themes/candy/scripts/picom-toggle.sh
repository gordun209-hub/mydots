#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom --experimental-backends -b --config ~/.config/picom/picom.conf
fi
