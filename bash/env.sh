#
# $XDG_CONFIG_HOME/bash/env.sh
#

## define environment variables

## default Apps
export EDITOR='vim'

## for XDG Base Directory
### Vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/init.vim" | source $MYVIMRC'
### less
export LESSHISTFILE=$XDG_DATA_HOME/lesshst
### GNU screen
export SCREENRC=$XDG_CONFIG_HOME/screen/screenrc
### Wget
export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc