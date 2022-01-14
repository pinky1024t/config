# Custom Prompt Theme for Bash
## default prompt
# PS1='[\u@\h \W]\$ '
## import git-prompt.sh
source $XDG_CONFIG_HOME/bash/prompt/git-prompt_nerdfonts.sh
# [[ -f /usr/share/git/git-prompt.sh ]] && source /usr/share/git/git-prompt.sh || source $XDG_CONFIG_HOME/bash/prompt/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1
## for wsl theme without NerdFonts
#PS1='\e[37;48;2;101;101;255m Arch \e[0m \e[34m\u\e[0m \e[32m\w\e[0m \e[38;2;0;38;152;48;2;101;255;101m$(__git_ps1 " %s ")\e[0m \n \$ '
## for wsl theme with NerdFonts
PS_DIST_LOGO=$'\e[37;48;2;0;0;135m \uf303  \e[0m'
PS_DIST_SEP=$'\e[38;2;0;0;135;48;2;46;46;156m\ue0b0\e[0m'
PS_TERM_NAME=$'\e[37;48;2;46;46;156m \uf489 bash \e[0m'
PS_TERM_SEP=$'\e[38;2;46;46;156;48;2;46;46;220m\ue0b0\e[0m'
PS_USER_NAME=$'\e[37;48;2;46;46;220m \u \e[0m'
PS_USER_SEP=$'\e[38;2;46;46;200;48;2;60;60;255m\ue0b0\e[0m'
PS_DIR_NAME=$'\e[37;48;2;60;60;255m \ue5fe \w \e[0m'
PS_DIR_SEP=$'\e[38;2;60;60;255;49m\ue0b0\e[0m'
ps_git_prompt()
{\
    __git_ps1 $' \e[37;43m \uf418 %s \e[33;49m\ue0b0'
    printf "\e[0m"
}
PS_END=" \n \$ "
export PS1="$PS_DIST_LOGO$PS_DIST_SEP$PS_TERM_NAME$PS_TERM_SEP$PS_USER_NAME$PS_USER_SEP$PS_DIR_NAME$PS_DIR_SEP\$(ps_git_prompt)$PS_END"