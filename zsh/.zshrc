# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker laravel5 last-working-dir)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

export DISABLE_AUTO_TITLE='true'

export BROWSER=~/Applications/Brave-x86_64_acb957db7ad84eecbd22009a3d721396.AppImage

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source ~/.aliases
source ~/.colors
source ~/.functions

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/lukz/.composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:$HOME/.nodenv/shims:$HOME/.rbenv/shims:$HOME/.config/composer/vendor/bin:$HOME/npm/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:/var/lib/snapd/snap/bin:/home/golfinho/.scripts:/home/golfinho/share/nvim/lsp_servers:$PATH"
export GOPATH="$HOME/go"

source $HOME/.profile

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

. /home/golfinho/.asdf/asdf.sh

# Github and docker keys
export GITHUB_PRIVATE_KEY_PATH="$HOME/.ssh/id_rsa"
export DOCKER_BUILDKIT=1

# Enable Vim mode in ZSH
# bindkey -v
#
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^E' edit-command-line                   # Opens Vim to edit current command line
# bindkey '^R' history-incremental-search-backward # Perform backward search in command line history
# bindkey '^S' history-incremental-search-forward  # Perform forward search in command line history
# bindkey '^P' history-search-backward             # Go back/search in history (autocomplete)
# bindkey '^N' history-search-forward              # Go forward/search in history (autocomplete)

eval "$(starship init zsh)"
