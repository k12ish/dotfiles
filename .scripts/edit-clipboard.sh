# This script allows the user to modify their clipboard with helix
# Set a keybinding to run this script in a terminal emulator: 
#
#     alacritty -e /home/krish/.scripts/edit-clipboard.sh


wl-paste > ~/.scripts/clipboard
helix ~/.scripts/clipboard
wl-copy < ~/.scripts/clipboard && true
