"Gnome Desktop Entry Format extensions - bootlegged documentation":
https://gist.github.com/najamelan/b44e943145b03e018229

also consider doing `nvim /var/log/syslog`

source code for autstart is here https://github.com/GNOME/gnome-session/blob/main/gnome-session/gsm-autostart-app.c

`setxkbmap -option caps:swapescape` doesn't work well at startup, instead use `dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"`

