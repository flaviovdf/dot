# Common
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

export WORKON_HOME=$HOME/virtualenvs/
source $HOME/.local/bin/virtualenvwrapper.sh

# manual ls colors
# export LS_COLORS=$LS_COLORS:'di=0;36:ln=0;34:ex=0;32:mi=0;31'

# base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
