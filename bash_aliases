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
alias ra="rake"
alias rmig='rake db:migrate'
alias rca='rake db:create:all'
alias rda='rake db:drop:all'
alias rdball='rake db:drop:all && rake db:create:all && rake db:migrate && rake db:seed && rake db:test:prepare'
alias bx='bundle exec'
alias bake="bundle exec rake"

#other
alias v='vim -p'

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

