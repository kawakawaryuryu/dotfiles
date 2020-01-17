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

# setup
./setup.sh

# symlink between home and dotfiles
./link.sh

# install vim plugin (on vim)
:call dein#install()
```

## Reference
- https://github.com/Shougo/dein.vim
