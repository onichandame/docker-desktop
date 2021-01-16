# start x11
docker-entrypoint.sh supervisord &
# start ibus
#ibus-daemon &
# shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Primary><Alt>t" -s "xfce4-terminal" -t string
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/Super_L" -s "xfce4-appfinder" -t string
# frontend keep alive
wait
