#
# fzf functions for zsh
#
## Define Environment Variables
export FZF_DEFAULT_OPTS="--reverse"
## Define functions
### search command history
function fzf-cmdhist-zsh() {
    if [[ -f $XDG_STATE_HOME/zsh/.zsh_history ]]; then
        local l=$(history -i 1 | fzf --tac --header="[ Command History Search ]" | cut -b 26-)
        if [[ -n $l ]]; then
            BUFFER=$l
            CURSOR=${#BUFFER}
        else
            BUFFER=$BUFFER
        fi
    else
        echo $'\n there is no histfile: $XDG_STATE_HOME/zsh/.zsh_history' && zle send-break
    fi
}
### search dir history
function fzf-dirhist-zsh() {
    if [[ -f $XDG_STATE_HOME/zsh/zdirs ]]; then
        local l=$(cat $XDG_STATE_HOME/zsh/zdirs | fzf --header="[ Directory History Search ]")
        if [[ -n $l ]]; then
            BUFFER="cd $l"
            CURSOR=${#BUFFER}
        else
            BUFFER=$BUFFER
        fi
    else
        echo $'\n there is no histfile: $XDG_STATE_HOME/zsh/zdirs' && zle send-break
    fi
}
### search directory in current directory
function fzf-dir-zsh() {
    local l=$(find * -type d -not -iwholename '*/.git*' 2>/dev/null | fzf --header="[ Directory Search ]")
    if [[ -n $l ]]; then
        [[ -z $BUFFER ]] && BUFFER="cd $l" || BUFFER="$BUFFER $l"
        CURSOR=${#BUFFER}
    else
        BUFFER=$BUFFER
    fi
}
### search file in current directory
function fzf-file-zsh() {
    local l=$(find * -type f -not -iwholename '*/.git/*' 2>/dev/null | fzf --header="[ File Search ]" --preview '[[ $(file -i {}) =~ binary ]] && echo {} is a binary file || head -50 {}')
    if [[ -n $l ]]; then
        [[ -z $BUFFER ]] && BUFFER="vim $l" || BUFFER="$BUFFER $l"
        CURSOR=${#BUFFER}
    else
        BUFFER=$BUFFER
    fi
}
### search packages
function fzf-yays-zsh() {
    local l=$(yay -Slq | fzf --multi --preview 'yay -Si {1}' --header="[ yay Packages Search ]" | sed -z 's/\n/ /g')
    if [[ -n $l ]]; then
        [[ -z $BUFFER ]] && BUFFER="yay -S $l" || BUFFER="$BUFFER $l"
        CURSOR=${#BUFFER}
    else
        BUFFER=$BUFFER
    fi
}
### search packages (installed)
function fzf-yayq-zsh() {
    local l=$(yay -Qq | fzf --multi --preview 'yay -Qi {1}' --header="[ yay Packages Search (installed) ]" | sed -z 's/\n/ /g')
    if [[ -n $l ]]; then
        [[ -z $BUFFER ]] && BUFFER="yay -Rs $l" || BUFFER="$BUFFER $l"
        CURSOR=${#BUFFER}
    else
        BUFFER=$BUFFER
    fi
}

## Register to key bindings
zle -N fzf-cmdhist-zsh
bindkey '^]q' fzf-cmdhist-zsh
zle -N fzf-dirhist-zsh
bindkey '^]w' fzf-dirhist-zsh
zle -N fzf-dir-zsh
bindkey '^]d' fzf-dir-zsh
zle -N fzf-file-zsh
bindkey '^]f' fzf-file-zsh
zle -N fzf-yays-zsh
bindkey '^]z' fzf-yays-zsh
zle -N fzf-yayq-zsh
bindkey '^]x' fzf-yayq-zsh