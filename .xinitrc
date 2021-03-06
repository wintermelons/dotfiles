#!/bin/sh
# .xinitrc

# --- resources ---
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# --- variables ---
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# --- configurations ---
xset r rate 250 30
xsetroot -cursor_name left_ptr
feh --randomize --bg-fill -z ~/Dropbox/pictures/wallpapers/*

case $1 in
  '')
    ;;
  reload|re)
    exit
    ;;
  extend|duo)
    xrandr --output VGA1 --off
    xrandr --output VGA1 --auto --right-of eDP1
    feh --randomize --bg-fill -z ~/Dropbox/pictures/wallpapers/*
    exit
    ;;
  dock)
    xrandr --output DP2-2 --off
    xrandr --output DP2-2 --auto --right-of eDP1
    feh --randomize --bg-fill -z ~/Dropbox/pictures/wallpapers/*
    exit
    ;;
  single|sol)
    xrandr --auto
    exit
    ;;
  *)
    echo "wrong arguments. accepted: reload|single|extend"
    exit
    ;;
esac

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# --- processes ---
compton --config ~/.compton.conf -b
dropboxd &
pamusb-agent &
xscreensaver -no-splash &
syndaemon -i 0.2 -k &
urxvtd -q -o -f

# --- window manager ---
exec xmonad
