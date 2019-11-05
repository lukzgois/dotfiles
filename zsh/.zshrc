# Path to your oh-my-zsh installation.
export ZSH=/home/lukz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker laravel5 last-working-dir)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/lukz/.composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:$HOME/.nodenv/shims:$HOME/.rbenv/shims:$HOME/.config/composer/vendor/bin:$HOME/npm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

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

###############################################
#            STARTUP MESSAGE                  #
###############################################

clear
echo -e "${lightgreen}";figlet "Welcome    Lukz";
echo -ne "${red}Today is:\t${cyan}" `date`; echo ""
echo -e "${red}Kernel: \t${cyan}" `uname -smr`
echo -ne "${cyan}";upinfo;echo ""
echo -e "${yellow}"; cal -3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
