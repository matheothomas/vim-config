#!/bin/bash

# Install nodeJS
curl -sL install-node.now.sh | sh

# Install yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# Create directories for coc's installation
mkdir -p ~/.vim/pack/coc/start

# Clone coc's repo
cd ~/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git --depth=1

# Install coc
cd ~/.vim/pack/coc/start/coc.nvim
yarn install

