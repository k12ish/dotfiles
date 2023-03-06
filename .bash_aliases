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

# Sync and upgrade all packages, ignoring `pyright`
alias syu='paru --ignore=pyright -Syu'

if grep -qi microsoft /proc/version; then
    # WSL
	alias b='wslview'
else
    # native Linux
	alias b='xdg-open'
fi


export EDITOR=helix
alias hx='helix'


iso(){
	date +"%Y-%m-%d %H:%M"
}

fcd() { 
	cd "$(fd -t d $1 | head -n1)" 
}

source-venv() { 
	source ./.venv/bin/activate
}
