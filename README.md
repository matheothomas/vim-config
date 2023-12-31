# Vim configuration

This is my personal vim configuration, as a computer science student.

## Content
- A vimrc file.
- A folder containing file templates.
- A bash script which creates, moves and installs all the necessary files :
    - creates the arborescence
    - moves the .vimrc file
    - creates the templates files
    - installs the theme
    - installs the plugin manager (Plug)
    - installs the plugins (see list below)

## Plugins
- [NERDTree](https://github.com/preservim/nerdtree) : displays the current arborescence and allows to navigate it.
- [airline](https://github.com/vim-airline/vim-airline) (and themes) : displays a status bar at the bottom of the buffer.
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) : automatically creates/deletes matching (, {, [, "...
- [vim-rainbow](https://github.com/frazrepo/vim-rainbow) : changes the colors of matching parentheses, only turned on for .scm files.

## Themes
- I use the [vim-colors-xcode](https://github.com/lunacookies/vim-colors-xcode) theme.

# Installation 
Import the files with :
```bash
git clone https://github.com/matheothomas/vim-config
```

Go in the newly created folder :
```bash
cd vim-config
```

Make the `vim_configurator.sh` and `remove-config.sh` inside of the `vim-config` folder executable : 
```bash
chmod 744 vim_configurator.sh remove-config.sh
```

Execute the bash script :
```bash
./vim_configurator.sh
```

Enter your name at line 108 of the .vimrc if you want the templates to be auto-filled.

## Requirements
Make sure that **git** and **curl** are installed.

## Uninstall
Execute the `remove-config.sh` script to uninstall the configuration. 

## Issues
There may be errors when first opening vim due to the importation of plugins, but should only happen once.
