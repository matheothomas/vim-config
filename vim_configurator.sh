#!/bin/bash

# Move the .vimrc.
cp .vimrc ~/

# Move the templates and to the right place.
mkdir ~/.vim/templates
cp templates/templates.* ~/.vim/templates

# clone the vim theme.
cd ~/
git clone https://github.com/arzg/vim-colors-xcode.git
mkdir .vim
cp -r vim-colors-xcode/{autoload,colors,doc} ~/.vim

