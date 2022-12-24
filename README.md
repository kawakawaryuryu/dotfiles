# dotfiles
- configuration dotfiles repository

## Setup on Mac
1. install Homebrew
  - https://brew.sh/index_ja

2. install Git or GitHub CLI
```bash
brew install git
# or
brew install gh
```

3. clone dotfiles
```bash
cd ~
git clone git@github.com:kawakawaryuryu/dotfiles.git
# or
cd ~
gh auth login
gh repo clone kawakawaryuryu/dotfiles
```

4. setup dotfiles
```bash
# setup
./setup.sh

# symlink between home and dotfiles
./link.sh
```

5. install vim plugin
```
# install vim plugin (on vim)
:call dein#install()
```

6. install packages with .Brewfile
```bash
brew bundle --file=~/.Brewfile_`hostname` -f
```

## setup on WSL2
same as from 1 to 6 of setup on Mac

7. change shell
```shell
echo `which zsh` | sudo tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
```

## setup on Windows

## Reference
- https://github.com/Shougo/dein.vim
