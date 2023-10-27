#!/bin/bash

# Renames the .vimrc.
mv vimrc .vimrc

# Saves the old configuration (if there wasn't, redirects the errors in logs.txt)
mkdir old-config
mv ~/.vimrc old-config && echo .vimrc > files.txt 
mv ~/.vim old-config && echo .vim > files.txt

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

