# --- oh-my-zsh Configuration ---

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="bira"
# ZSH_THEME="agnoster"
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Currently an open issue that affects Debian: https://github.com/robbyrussell/oh-my-zsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Moved plugins to the end (some of them change $PATH)

# --- User Configuration ---

# Base path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
MANPATH="/usr/share/man:/usr/local/share/man:/usr/local/man"

# Perl path
PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# GO
export GOPATH=$HOME/dev/go
PATH="$GOPATH/bin:$PATH"

# Rbenv (put into plugin)
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init - zsh)"

# Anaconda (Python)
PATH="$HOME/anaconda3/bin:$PATH"

# PGSQL
# export PGROOT="$HOME/data/postgresql"
# export PGROOT="/var/lib/postgres"
export PGDATA="$HOME/data/postgresql"

# SSH
export SSH_KEY_PATH="~/.ssh/"
# This is now supported natively by Zsh
# source ~/.bin/.ssh_completion_zsh

# PostgreSQL
export LD_LIBRARY_PATH=/usr/local/pgsql/lib
PATH="/usr/local/pgsql/bin:$PATH"
MANPATH="/usr/local/pgsql/man:$MANPATH"

# Editor
export EDITOR=vi

# SDKs
# PATH=$HOME/dev/SDKs/android-sdk-linux/tools:$PATH   # Android
# PATH=$HOME/dev/SDKs/activator-dist-1.3.6:$PATH      # Typesafe Activator

# User Scripts
PATH=$HOME/bin:$HOME/.bin:$HOME/.local/scripts:$HOME/.local/bin:$PATH

# Preload for Spotify (wm)
# export LD_PRELOAD=/usr/lib/libcurl.so.3:/home/melody/dev/spotifywm/spotifywm.so # /usr/share/spotify/spotify

# Key Bindings
bindkey -M emacs 'C;BS~' backward-kill-word
bindkey -M emacs 'C;DEL~' kill-word
bindkey -M emacs '' backward-kill-word
bindkey -M emacs '[3;5~' kill-word

# Aliases
alias ll="ls -laG"
alias vi="vim"
open () { nohup xdg-open "$@" 2>&1 >/dev/null & }
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# Export paths
export PATH
export MANPATH

# Welcome Message
# fortune -a  | lolcat

# --- oh-my-zsh Plugins ---

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins+=(nvm rbenv fzf zsh-completions zsh-syntax-highlighting)  # zsh-syntax-highlighting must be at the end
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh
