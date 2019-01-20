# dotfiles
- configuration dotfiles repository

## Initial setting

```shell
# install GNU GLOBAL
## Mac
$ brew install global

# install peco
## Mac
$ brew install peco

# clone repository
$ git clone git@github.com:kawakawaryuryu/dotfiles.git

# download installer.sh of dein
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein

# execute script
$ ./link.sh

# install vim plugin (on vim)
:call dein#install()
```

## Reference
- https://github.com/Shougo/dein.vim
