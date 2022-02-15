#
# fzf functions for bash
#
## Define Environment Variables
export FZF_DEFAULT_OPTS="--reverse"
## Define functions
### search command history
function fzf-cmdhist-bash() {
    if [[ -f $XDG_STATE_HOME/zsh/.zsh_history ]]; then
        local l=$(history -i 1 | fzf --tac --header="[ Command History Search ]" | cut -b 26-)
        if [[ -n $l ]]; then
            READLINE_LINE=$l
            READLINE_POINT=${#READLINE_LINE}
        else
            READLINE_LINE=$READLINE_LINE
        fi
    else
        echo $'\n there is no histfile: $XDG_STATE_HOME/zsh/.zsh_history' && zle send-break
    fi
}
### search directory in current directory
function fzf-dir-bash() {
    local l=$(find * -type d -not -iwholename '*/.git*' 2>/dev/null | fzf --header="[ Directory Search ]")
    if [[ -n $l ]]; then
        [[ -z $READLINE_LINE ]] && READLINE_LINE="cd $l" || READLINE_LINE="$READLINE_LINE $l"
        READLINE_POINT=${#READLINE_LINE}
    else
        READLINE_LINE=$READLINE_LINE
    fi
}
### search file in current directory
function fzf-file-bash() {
    local l=$(find * -type f -not -iwholename '*/.git/*' 2>/dev/null | fzf --header="[ File Search ]" --preview '[[ $(file -i {}) =~ binary ]] && echo {} is a binary file || head -50 {}')
    if [[ -n $l ]]; then
        [[ -z $READLINE_LINE ]] && READLINE_LINE="vim $l" || READLINE_LINE="$READLINE_LINE $l"
        READLINE_POINT=${#READLINE_LINE}
    else
        READLINE_LINE=$READLINE_LINE
    fi
}
### search packages
function fzf-yays-bash() {
    local l=$(yay -Slq | fzf --multi --preview 'yay -Si {1}' --header="[ yay Packages Search ]" | sed -z 's/\n/ /g')
    if [[ -n $l ]]; then
        [[ -z $READLINE_LINE ]] && READLINE_LINE="yay -S $l" || READLINE_LINE="$READLINE_LINE $l"
        READLINE_POINT=${#READLINE_LINE}
    else
        READLINE_LINE=$READLINE_LINE
    fi
}
### search packages (installed)
function fzf-yayq-bash() {
    local l=$(yay -Qq | fzf --multi --preview 'yay -Qi {1}' --header="[ yay Packages Search (installed) ]" | sed -z 's/\n/ /g')
    if [[ -n $l ]]; then
        [[ -z $READLINE_LINE ]] && READLINE_LINE="yay -Rs $l" || READLINE_LINE="$READLINE_LINE $l"
        READLINE_POINT=${#READLINE_LINE}
    else
        READLINE_LINE=$READLINE_LINE
    fi
}