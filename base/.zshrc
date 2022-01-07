# ~/.zshrc

export ZSH_CACHE_DIR=~/.cache/zsh
export EDITOR="code -w"

# Setup ZSH history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
## History command configuration
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS

# Setup Antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1


# Setup Starship prompt
eval "$(starship init zsh)"

# Aliases
alias history="history 1"
alias hist="history | grep"
alias sc="source $HOME/.zshrc"
alias ec="$EDITOR $HOME/.zshrc"
alias cat="ccat"
alias ll="ls -alG"
alias ls="ls -lG"
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# Redo as sudo
alias fuck='sudo $(fc -ln -1)'

## Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup direnv
eval "$(direnv hook zsh)"