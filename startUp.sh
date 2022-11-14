ln -sf ~/.dotfiles/.vimrc .vimrc
ln -sf ~/.dotfiles/.vim .vim
ln -sf ~/.dotfiles/.gitconfig .gitconfig

vim 
rm -rf ~/.dotfiles/.vim/plugged/vim-easycomplete/snippets/ultisnips
ln -sf ~/.dotfiles/.vim/plugged/Ultisnips ./dotfiles/.vim/plugged/vim-easycomplete/snippets/ultisnips

firefox about:preferences#search https://bitwarden.com  https://github.com  https://uantwerpen.be&


EDITOR=vim
