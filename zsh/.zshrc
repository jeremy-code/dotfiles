# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=agnoster
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)
ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh

# Update settings
zstyle ':omz:update' mode auto

# Completion settings
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
COMPLETION_WAITING_DOTS=true

# Automatic title
DISABLE_AUTO_TITLE=true

# Library settings
ENABLE_CORRECTION=true
HIST_STAMPS="mm/dd/yyyy"

# NVM configuration
NVM_COMPLETION=true
NVM_AUTO_USE=true

source $ZSH/oh-my-zsh.sh
