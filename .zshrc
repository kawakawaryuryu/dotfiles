# Created by newuser for 5.3.1

# compinit
autoload -U compinit
compinit

# alias
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'

# prompt
PROMPT='%F{green}%n%f@%F{magenta}%m%f:%~ %% '

# completion
zstyle ':completion:*:default' menu select=2
bindkey "^[[Z" reverse-menu-complete    # Shit-Tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # don't distinguish lowercase and uppercase

# spell correction
#setopt correct

# no sound
setopt no_beep

# grep setting
export GREP_OPTIONS='--color=auto'

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

# invalidate Ctrl-s and Ctrl-q
stty stop undef # Ctrl-s
stty start undef    # Ctrl-q

# Ctrl-w setting(delimit by slash)
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

# peco setting
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

source ~/.zshrc_local
