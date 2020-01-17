#!/bin/sh

# zsh
touch .zshrc_local
mkdir -p .zsh/completion

# install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.cache/dein

# install docker zsh completion
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > .zsh/completion/_docker
curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose > .zsh/completion/_docker-compose

