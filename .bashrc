#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.bash_aliases

eval "$(zoxide init bash)"
eval "$(starship init bash)"

# depends on fortune-mod, cowsay and lolcat
fortune -s | cowthink | lolcat



# broot
source /home/krish/.config/broot/launcher/bash/br
