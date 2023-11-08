#
# ~/.bashrc
#

export ANSIBLE_NOCOWS=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.bash_aliases

eval "$(zoxide init bash)"


hosts=("optiplex" "dynabook")

for host in "${hosts[@]}"; do
  if [[ $host == $HOSTNAME ]]; then
    eval "$(starship init bash)"
    # depends on fortune-mod, cowsay and lolcat
    if [ -z "$(config status -s)" ]; then
      # empty output for status, we can print something funny
      fortune -s | cowsay | lolcat
    else
      config status | sed 's/([^)]*)//g' | cowsay -f sheep | lolcat
    fi
  fi
done
