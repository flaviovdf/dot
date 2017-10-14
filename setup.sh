ln -s $HOME/dot/bashrc $HOME/.bashrc

ln -s $HOME/dot/vim $HOME/.vim
ln -s $HOME/dot/vimrc $HOME/.vimrc
if [[ ! -e $HOME/.config/ ]]; then
    mkdir $HOME/.config/
fi
ln -s $HOME/dot/vim ~/.config/nvim

echo "Install python3 and neovim"
echo "Install ctags"
echo "Execute pip3 install neovim"
