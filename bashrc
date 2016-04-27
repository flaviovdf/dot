#Homebrew
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#Aliases
alias ls='ls --color'
alias vim='nvim'
alias weather="curl http://wttr.in/"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

#Exports
export EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
