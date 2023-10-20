#!/bin/bash

# Renames the .vimrc.
mv vimrc .vimrc

# Keeps the old configuration.
mv ~/.vimrc ~/.vimrc_old

# Moves the new .vimrc.
cp .vimrc ~/
mkdir ~/.vim

# Moves the templates to the right place.
mkdir ~/.vim/templates
cp templates/template.* ~/.vim/templates/

# clones the vim theme.
cd ~/
git clone https://github.com/arzg/vim-colors-xcode.git
cp -r vim-colors-xcode/{autoload,colors,doc} ~/.vim

