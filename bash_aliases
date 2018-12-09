#Custom aliases
#git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gca="git commit --amend"
alias gd='git diff'
alias gdc='git diff --cached'
alias gfa='git fetch --all'
alias gl='git log'
alias glg='git lg'
alias gco='git checkout'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gst='git status -sb'
alias gri='git rebase -i'
alias gpu='git pull'
alias gmf="git merge --ff-only"

_git_checkout_pull_request() {
  git fetch origin pull/$1/head:${2:-$1}
}
alias gcopr=_git_checkout_pull_request

# Rails
alias bx='bundle exec'

#other
alias fix-camera='sudo killall VDCAssistant'
alias irb='irb --readline -r irb/completion'
alias v='vim -p'
alias vi='vim'
alias cat='bat'
alias ping='prettyping --nolegend'
alias top="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias paste=pbpaste
# it's useful to see what I've just copied, ie. `cat foo | copy`
alias copy='pbcopy; pbpaste'

alias bell='echo \\a'

man() {
    env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
