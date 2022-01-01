#
# ${XDG_CONFIG_HOME}/zsh/.zshrc
#

## identify distribution name
if [[ -f /etc/issue ]]; then
    DIST=$(cat /etc/issue | sed -z 's/ .*//; s/\n//g')
else
    DIST=""
fi

## Create XDG Base Directory
[[ ! -d $XDG_CACHE_HOME ]] && mkdir $XDG_CACHE_HOME
[[ ! -d $XDG_DATA_HOME ]] && mkdir $XDG_DATA_HOME
[[ ! -d $XDG_STATE_HOME ]] && mkdir $XDG_STATE_HOME

## source grml .zshrc if distribution is not Arch Linux
if [[ $DIST != "Arch" ]]; then
    [[ $XDG_CONFIG_HOME/zsh/grml/.zshrc ]] && source $XDG_CONFIG_HOME/zsh/grml/.zshrc
fi

## alias
### source alias for bash
[[ -f $XDG_CONFIG_HOME/bash/alias.sh ]] && source $XDG_CONFIG_HOME/bash/alias.sh
## #source alias for zsh
[[ -f $XDG_CONFIG_HOME/zsh/alias.zsh ]] && source $XDG_CONFIG_HOME/zsh/alias.zsh
### expand alias inline by space
function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

## prompt theme
if [[ $DIST=="Arch" ]]; then
    [[ -f $XDG_CONFIG_HOME/zsh/prompt/arch.zsh ]] && source $XDG_CONFIG_HOME/zsh/prompt/arch.zsh
elif [[ $DIST=="Ubuntu" ]]; then
    [[ -f $XDG_CONFIG_HOME/zsh/prompt/ubuntu.zsh ]] && source $XDG_CONFIG_HOME/zsh/prompt/ubuntu.zsh
fi

## history
[[ ! -d $XDG_STATE_HOME/zsh ]] && mkdir $XDG_STATE_HOME/zsh
export HISTFILE=$XDG_STATE_HOME/zsh/.zsh_history
export HISTSIZE=9000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history
setopt append_history
setopt inc_append_history

## zcompdump
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir $XDG_CACHE_HOME/zsh
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

## environment variables
[[ -f $XDG_CONFIG_HOME/bash/env.sh ]] && source $XDG_CONFIG_HOME/bash/env.sh