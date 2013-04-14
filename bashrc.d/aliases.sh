# updating the bash environment "live"
alias bashrc="unalias -a && . ~/.bashrc"

alias cls=clear

# navigation
function mc() { mkdir "$@" && cd "${!#}"; } # last argument: http://j.mp/oXkE4L
function p() { cd "$HOME/Dropbox/Projects/$1"; }
alias ll="ls -lF"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# editing
function e() { [ -z $DISPLAY ] && vimx "$@" || ( gvim --remote-silent "$@"; wmctrl -a GVIM; ) }
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
if [ -x $(which hub) ]; then
  alias git=hub
fi
alias ga="git add"
alias gmv="git mv"
alias grm="git rm"

alias gb="git blame"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gll="git log --graph --decorate"

alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gcam="git commit -am"

alias gco="git checkout"
alias gcb="git checkout -b"
alias gcbo="git checkout --orphan"
alias gb="git branch"

alias gp="git push"
alias gu="git pull"
alias gpl="git pull"
alias gf="git fetch"
alias gup="git remote update"
alias gls="git ls-files | grep -v '^\.' | xargs ls"
alias gla="git ls-files | xargs ls"

# other
alias db=dropbox

# yucca
alias gum="yucca wrap gem"
alias yam="yucca wrap yum"

export EDITOR=vimx
