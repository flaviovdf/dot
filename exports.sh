# Common
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="/home/flaviovdf/anaconda3/bin:$PATH"

# manual ls colors
export LS_COLORS=$LS_COLORS:'di=0;36:ln=0;34:ex=0;32:mi=0;31'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
