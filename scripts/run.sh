#!/bin/sh

function start_desktop(){
  /root/autostartup.sh &
}

function start_ibus(){
  ibus-daemon &
}

function setup_shortcuts(){
  xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Primary><Alt>t" -s "xfce4-terminal" -t string
  xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/Super_L" -s "xfce4-appfinder" -t string
}

start_desktop
# wait for desktop env to start
start_ibus
#setup_shortcuts

# frontend keep alive
"$@"
wait
