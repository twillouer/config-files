# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="kolo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git autojump command-not-found mvn)
plugins=(git command-not-found mvn docker docker-compose scala sbt ant github git-extras gitignore pip gem rbenv jsontools vagrant autojump)

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR=vim

PROMPT='(%M) %B%F{magenta}%d%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %B%F{blue}%T%{$reset_color%}%% '
#PROMPT='%B%F{magenta}%d%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %B%F{blue}%T%{$reset_color%}%% '
#PROMPT='%B%F{green}%n@%M %b%F{magenta}%d%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %B%F{blue}%T%{$reset_color%}%% '


hash -d prj=~/Projets
hash -d doc=~/Projets/documents
hash -d mpa=~/Projets/mypublicalerts
hash -d docprj=~/Projets/documents/projets
hash -d flow=~/Projets/deveryflow
hash -d dloc=~/Projets/deveryloc
hash -d dgo=~/Projets/deverygo
hash -d dutils=~/Projets/deveryutils
hash -d dauth=~/Projets/deveryauth
hash -d tram=~/Projets/tram
hash -d bazar=~/Projets/bazar

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/notifyosd.zsh ]; then
    . ~/notifyosd.zsh 
fi

if [ -f ~/.rbenvrc ]; then
    source ~/.rbenvrc
fi
