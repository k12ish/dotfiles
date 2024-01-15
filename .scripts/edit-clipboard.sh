# This script allows the user to modify their clipboard with helix
# Set a keybinding to run this script in a terminal emulator: 
#
#     alacritty -e /home/krish/.scripts/edit-clipboard.sh


export CLIPBOARD_FILE="/home/krish/.scripts/clipboard"

wl-paste > /home/krish/.scripts/clipboard

python /home/krish/.scripts/download-mathpix-image.py

if [ $? -eq 0 ]; then
  # python script ran successfully, we have image at ~/.scripts/clipboard
  # nothing to do!
  true
else
  helix /home/krish/.scripts/clipboard
fi

wl-copy < /home/krish/.scripts/clipboard && true
