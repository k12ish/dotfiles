#
# ~/.bashrc
#

export ANSIBLE_NOCOWS=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.bash_aliases

eval "$(zoxide init bash)"


if [ "$HOSTNAME" = optiplex ]; then
  # depends on fortune-mod, cowsay and lolcat
  eval "$(starship init bash)"
  fortune -s | cowthink | lolcat
fi

