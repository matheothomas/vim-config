#!/bin/bash

# removes the new .vimrc, the custom templates and the theme.
rm ~/.vimrc
rm -r ~/.vim/templates/template.*
rm -r ~/vim-colors-xcode

# Puts back the saved configuration.
mv old-config/* ~/

# removes the installation files etc.
rm -r ../vim-config
