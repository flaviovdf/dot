if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls -p --color'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -p -G'
fi

alias top='htop'
alias vim='nvim'
alias weather='curl http://wttr.in/'

md2pdf() {
  pandoc $1 -o `basename $1 .md`.pdf
}
