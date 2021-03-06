#
# ${XDG_CONFIG_HOME}/bash/.bashrc
#
## If not running interactively, don't do anything
[[ $- != *i* ]] && return

## identify distribution name
if [[ -f /etc/issue ]]; then
    DIST=$(cat /etc/issue | sed -z 's/ .*//; s/\n//g')
else
    DIST=""
fi

## if $DIST is Ubuntu, use Ubuntu's default .bashrc
if [[ "$DIST" == "Ubuntu" ]]; then
    [[ -f $XDG_CONFIG_HOME/bash/ubuntu_default_rc.sh ]] && source $XDG_CONFIG_HOME/bash/ubuntu_default_rc.sh
fi

## Create XDG Base Directory
[[ ! -d $XDG_CACHE_HOME ]] && mkdir $XDG_CACHE_HOME
[[ ! -d $XDG_DATA_HOME ]] && mkdir $XDG_DATA_HOME
[[ ! -d $XDG_STATE_HOME ]] && mkdir $XDG_STATE_HOME

## alias
[[ -f $XDG_CONFIG_HOME/bash/alias.sh ]] && source $XDG_CONFIG_HOME/bash/alias.sh

## prompt
if [[ "$DIST" == "Arch" ]]; then
    [[ -f $XDG_CONFIG_HOME/bash/prompt/arch.sh ]] && source $XDG_CONFIG_HOME/bash/prompt/arch.sh
elif [[ "$DIST" == "Ubuntu" ]]; then
    [[ -f $XDG_CONFIG_HOME/bash/prompt/ubuntu.sh ]] && source $XDG_CONFIG_HOME/bash/prompt/ubuntu.sh
fi

## history
[[ ! -d $XDG_STATE_HOME/bash ]] && mkdir $XDG_STATE_HOME/bash
export HISTFILE=$XDG_STATE_HOME/bash/.bash_history
export HISTSIZE=9000
export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:history
export HISTTIMEFORMAT='%Y-%m-%d %H:%M '
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend