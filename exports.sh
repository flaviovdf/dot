# Common
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="$HOME/miniconda3/bin:$PATH"

# manual ls colors
# export LS_COLORS=$LS_COLORS:'di=0;36:ln=0;34:ex=0;32:mi=0;31'

# base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# set's current working dir for terminals that do not support it
function __cd() {
  cd $* && (pwd > /dev/shm/$USER-yakuake-cwd);
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  T=$(basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat \
   | cut -d \  -f 4) | tail -1 | sed 's/^.* //'))
  if [[ $T == "yakuake" ]]; then
    if [[ -e /dev/shm/$USER-yakuake-cwd ]]; then
      cd "$(cat /dev/shm/$USER-yakuake-cwd)"
    fi
    alias cd='__cd'
  fi
fi
