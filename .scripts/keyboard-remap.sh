# This script allows the user to remap their keyboard
#
#     ~/.scripts/keyboard-remap.sh
#
# Use of this script at startup has been superceeded by this executing this command once:
#
#       dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
#


date | xargs -I _ echo ./keyboard-remap.sh ran at _ >> ~/.scripts/keyboard-remap.log
setxkbmap -option caps:swapescape >> ~/.scripts/keyboard-remap.log
