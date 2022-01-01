## Alias for bash and zsh
## ls
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
## sudoedit
alias svim='SUDO_EDITOR=vim sudoedit'
## windows cmd for wsl
alias winex='explorer.exe .'
## package manager
alias psu='sudo pacman -Syu'
alias psy='sudo pacman -Sy'
alias pss='sudo pacman -Ss'
alias psi='sudo pacman -S'
alias ysu='yay -Syu'
alias ysy='yay -Sy'
alias ysi='yay -S'
alias yss='yay -Ss'
## cd
alias cdc='cd $XDG_CONFIG_HOME'
## code
alias coc='code $XDG_CONFIG_HOME'
alias coh='code $HOME'
## wget
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/wget-hsts"'