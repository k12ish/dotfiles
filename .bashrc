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
    # depends on fortune-mod, cowsay and lolcat
    eval "$(starship init bash)"
    fortune -s | cowthink | lolcat
  fi
done
