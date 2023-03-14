# config setup
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

alias mank='man -k'

# -S, --smart-case, Searches case insensitively if input pattern is all lowercase
# -M, --max-columns, Omit output lines above certain length
alias rg='rg -S -M1000'

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
