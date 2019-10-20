# Created by newuser for 5.3.1

# compinit
autoload -U compinit
compinit

# alias
alias ll='ls -l'
alias la='ls -la'
alias g='git'

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' formats '%F{blue}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b(%F{cyan}%a%f)]'
precmd () { vcs_info }

# prompt
PROMPT='%F{green}%n%f@%F{magenta}%m%f:%~ ${vcs_info_msg_0_}
%% '

# completion
zstyle ':completion:*:default' menu select=2
bindkey "^[[Z" reverse-menu-complete    # Shit-Tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # don't distinguish lowercase and uppercase
source <(kubectl completion zsh) # kubectl
source <(ksec completion zsh) # kubesec

# spell correction
#setopt correct

# no sound
setopt no_beep

# grep setting
export GREP_OPTIONS='--color=auto'

# history
setopt extended_history
setopt share_history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# invalidate Ctrl-s and Ctrl-q
stty stop undef # Ctrl-s
stty start undef    # Ctrl-q

# Ctrl-w setting(delimit by slash)
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

[ -f .zshrc_`uname` ] && source ~/.zshrc_`uname`
source ~/.zshrc_local
