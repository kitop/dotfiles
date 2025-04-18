# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kito"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_IGNORE_SPACE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew docker aws gitfast macos) # zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

# rbenv
if [ -d ~/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init - zsh)"
fi

export GOPATH=$HOME/go
export ASDF_DATA_DIR=/Users/kito/.asdf

export PATH="$ASDF_DATA_DIR/shims:$PATH"
export PATH=/usr/local/sbin:$PATH
export PATH=~/.bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=".git/safe/../../bin:$PATH"

export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

if [ -f /usr/local/share/zsh/site-functions ]; then
  . /usr/local/share/zsh/site-functions
fi


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Customize to your needs...
export EDITOR="vim"
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export BAT_THEME="Solarized (dark)"

#fixing strange git errors
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f ~/.secrets ]; then
    . ~/.secrets
fi
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
eval "$(atuin init zsh)"
