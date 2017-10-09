alias ls='ls -p --color'
alias vim='nvim'
alias weather='curl http://wttr.in/'

md2pdf() {
  pandoc $1 -o `basename $1 .md`.pdf
}
