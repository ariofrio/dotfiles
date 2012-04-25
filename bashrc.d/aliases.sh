# updating the bash environment "live"
alias bashrc="unalias -a && . ~/.bashrc"

# navigation
function mc() { mkdir "$@" && cd "${!#}"; } # last argument: http://j.mp/oXkE4L
function p() { cd "$HOME/Dropbox/Projects/$1"; }
alias ll="ls -alF"
alias la="ls -A"
alias lf="ls -CF"
alias l="ls"

# editing
alias v=vimx
alias o=xdg-open
alias rmr="rm -R"

# *ake
alias m=make
function vm() { v Makefile; }
alias r=rake
function vr() { v Rakefile; }
alias b=bundle
function vb() { v Gemfile; }

# git
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gp="git push"
alias gpl="git pull"
alias gm="git merge"
alias gf="git fetch"
alias gv="git mv"

# other
alias db=dropbox
