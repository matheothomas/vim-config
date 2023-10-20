#!/bin/bash

# Move the .vimrc.
mv vimrc .vimrc
cp .vimrc ~/
mkdir ~/.vim

# Move the templates and to the right place.
mkdir ~/.vim/templates
cp templates/template.* ~/.vim/templates/

# clone the vim theme.
cd ~/
git clone https://github.com/arzg/vim-colors-xcode.git
cp -r vim-colors-xcode/{autoload,colors,doc} ~/.vim

