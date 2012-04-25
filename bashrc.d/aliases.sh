# updating the bash environment "live"
alias bashrc="unalias -a && . ~/.bashrc"

# navigation
function mc() { mkdir "$@" && cd "${!#}"; } # last argument: http://j.mp/oXkE4L
function p() { cd "$HOME/Dropbox/Projects/$1"; }
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# editing
function v() { [ -z $DISPLAY ] && vimx "$@" || gvim --remote "$@"; }
alias e=v
alias s=e # Habits die hard.
alias o=xdg-open
alias rmr="rm -R"
alias rmrf="rm -Rf"

# *ake
alias m=make
function vm() { v Makefile; }
alias r=rake
function vr() { v Rakefile; }
alias b=bundle
function vb() { v Gemfile; }

# git
alias ga="git add"
alias gb="git blame"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gc="git commit"
alias gp="git push"

alias gco="git checkout"
alias gb="git branch"
alias gpl="git pull"
alias gmv="git mv"
alias grm="git rm"

# other
alias db=dropbox
