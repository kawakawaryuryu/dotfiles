# Created by newuser for 5.3.1

# fpath
fpath=(~/.zsh/completion $fpath)

# compinit
autoload -Uz compinit
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
if type brew &> /dev/null; then
  fpath=($(brew --prefix)/share/zsh-completions $fpath)

  autoload -Uz compinit
  compinit
fi
zstyle ':completion:*:default' menu select=2
bindkey "^[[Z" reverse-menu-complete    # Shit-Tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # don't distinguish lowercase and uppercase
source <(kubectl completion zsh) # kubectl
source <(ksec completion zsh) # kubesec

###-begin-cdktf-completions-###
#
# yargs command completion script
#
# Installation: /Users/kawaryu/.npm/_npx/53ad3fe84cc9163d/node_modules/.bin/cdktf completion >> ~/.zshrc
#    or /Users/kawaryu/.npm/_npx/53ad3fe84cc9163d/node_modules/.bin/cdktf completion >> ~/.zprofile on OSX.
#
_cdktf_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /Users/kawaryu/.npm/_npx/53ad3fe84cc9163d/node_modules/.bin/cdktf --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _cdktf_yargs_completions cdktf
###-end-cdktf-completions-###

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
[ -f .zshrc_`hostname` ] && source ~/.zshrc_`hostname`
source ~/.zshrc_local

[ -f "/Users/kawaryu/.ghcup/env" ] && . "/Users/kawaryu/.ghcup/env" # ghcup-env