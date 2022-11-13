
# This script allows the user to modify their clipboard with neovim
# Set a keybinding to run this script in a terminal emulator: 
#
#     alacritty -e ~/.scripts/nvim-edit-clipboard.sh


xclip -selection clipboard -o > ~/.scripts/clipboard
nvim ~/.scripts/clipboard
xclip ~/.scripts/clipboard -selection clipboard && true

# weirdness: xclip is designed to silently operate in the background; this
# sleep is a bodge. Consult `man xclip` if you wish to sink more time into this
sleep 0.1
