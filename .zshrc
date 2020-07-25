
# Load zprof and zmv (modules included with zsh)
zmodload zsh/zprof
autoload zmv


# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# History settings
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt inc_append_history

# Load personal functions/aliases
source "${ZDOTDIR:-$HOME}/.dotfiles/functions.sh"
source "${ZDOTDIR:-$HOME}/.dotfiles/aliases.sh"
setopt share_history
setopt HIST_FIND_NO_DUPS

# Node Version Manager (https://github.com/nvm-sh/nvm#usage)
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# Fix WSL weird folder colors
LS_COLORS="ow=01;36;40" && export LS_COLORS


# Init history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


# Init Starship prompt
export STARSHIP_CONFIG=~/.starship.toml
eval "$(starship init zsh)"

# Colorls setup
source $(dirname $(gem which colorls))/tab_complete.sh

# Youtube-dl PATH
export PATH=$PATH://home/sonny/.local/bin

# Welcome Message
toilet -f ANSI\ Shadow "KEK"  && (fortune | cowsay -f tux) | lolcat
