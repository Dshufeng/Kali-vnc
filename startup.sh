#!/bin/sh
rm -rfv /tmp/.X*-lock /tmp/.X11-unix || echo "remove old vnc locks to be a reattachable container"


## change vnc password
echo -e "\n------------------ change VNC password  ------------------"
# first entry is control, second is view (if only one is valid for both)
mkdir -p "$HOME/.vnc"
PASSWD_PATH="$HOME/.vnc/passwd"
echo 123456 | vncpasswd -f >> $PASSWD_PATH
chmod 600 $PASSWD_PATH

# Start XServer
vncserver :1 &

tail -f /dev/null

