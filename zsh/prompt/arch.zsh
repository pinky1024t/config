# Custom Prompt Theme for Zsh
## import git-prompt.sh
[[ -f /usr/share/git/git-prompt.sh ]] && source /usr/share/git/git-prompt.sh || source $XDG_CONFIG_HOME/bash/prompt/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1
## for wsl theme with NerdFonts
PS_DIST_LOGO=$'\e[37;48;2;0;0;135m \uf303  \e[0m'
PS_DIST_SEP=$'\e[38;2;0;0;135;48;2;46;46;156m\ue0c6\e[0m'
PS_TERM_NAME=$'\e[37;48;2;46;46;156m \uf489 zsh \e[0m'
PS_TERM_SEP=$'\e[38;2;46;46;156;48;2;46;46;220m\ue0c6\e[0m'
PS_USER_NAME=$'\e[37;48;2;46;46;220m %n \e[0m'
PS_USER_SEP=$'\e[38;2;46;46;200;48;2;60;60;255m\ue0c6\e[0m'
PS_DIR_NAME=$'\e[37;48;2;60;60;255m \ue5fe %~ \e[0m'
PS_DIR_SEP=$'\e[38;2;60;60;255;49m\ue0c6\e[0m'
PS_END=$'\n %% '
PS_ALL="$PS_DIST_LOGO$PS_DIST_SEP$PS_TERM_NAME$PS_TERM_SEP$PS_USER_NAME$PS_USER_SEP$PS_DIR_NAME$PS_DIR_SEP"
prompt off
precmd(){ __git_ps1 "$PS_ALL" "$PS_END" " \e[37;43m \uf418 %s \e[33;49m\ue0c6\e[0m" }
RPROMPT="%*"