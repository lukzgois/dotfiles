# Path to your oh-my-zsh installation.
export ZSH=/home/lukz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/lukz/.composer/vendor/bin:$HOME/.rbenv/shims"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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


###############################################
#          PHP ENV                            #
##############################################
export PATH="/home/lukz/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

###############################################
#             ALIASES                         #
###############################################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# General
alias zshconfig="vim ~/.zshrc"
alias ls="ls --color=auto"
alias ll="ls -lahF"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Composer
alias c="composer"
alias ci="composer install --prefer-dist"
alias cu="composer update --prefer-dist"

# Git
alias gt="git status"
alias ga="git add --all"
alias gc="git commit"
alias gp="git push"
alias gck="git checkout"
alias gpl="git pull"

# Azk
alias as="azk shell"
alias ast="azk start"
alias astp="azk stop"
alias ar="azk restart"

# Docker
alias docker-clean="docker rm \$(docker ps -aqf 'status=exited' -f 'status=dead')"
alias docker-clean-images="docker rmi \$(docker images -f 'dangling=true' -q)"


# azk source and azk brew
if [ -d "$HOME/Development/azk/bin/azk" ]; then
  alias azksrc="$HOME/Development/azk/bin/azk"
fi

###############################################
#             COLOR VARS                      #
###############################################

black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

###############################################
#            STARTUP MESSAGE                  #
###############################################

upinfo ()
{
  echo -ne "${red}Uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

clear
echo -e "${lightgreen}";figlet "Welcome    Lukz";
echo -ne "${red}Today is:\t${cyan}" `date`; echo ""
echo -e "${red}Kernel: \t${cyan}" `uname -smr`
echo -ne "${cyan}";upinfo;echo ""
echo -e "${yellow}"; cal -3
