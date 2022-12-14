# config setup
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

alias mank='man -k'

# -S, --smart-case                             
# Searches case insensitively if input pattern is all lowercase
alias rg='rg -S'

alias b='xdg-open'

export EDITOR=helix
alias hx='helix'


iso(){
	date +"%Y-%m-%d %H:%M"
}

fcd() { 
	cd "$(fd -t d $1 | head -n1)" 
}
