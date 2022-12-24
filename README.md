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

7. (optional) export installed package list to Brewfile
```bash
brew bundle dump --file=~/.Brewfile_`hostname` -f
```

## setup on WSL2
same as 1 to 6 of setup on Mac

7. change shell
```shell
echo `which zsh` | sudo tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
```

## setup on Windows
same as 2 and 3 of setup on Mac

3. install packages with winget_$(hostname).json
```bash
winget.exe import -i winget_$(hostname).json
```

4. (optional) export installed package list to winget.json file
```bash
winget.exe export -o winget_$(hostname).json
```

## Reference
- https://github.com/Shougo/dein.vim
