#zstyle :compinstall filename '/home/ariofrio/.zshrc'
#autoload -Uz compinit
#compinit
# End of lines added by compinstall

source ~/.antigen.zsh
antigen-use oh-my-zsh

bundles=(bundler coffee github heroku rsync scala vundle yum)
print -l $bundles | antigen-bundles
antigen-apply

source ~/.fresh/build/shell.sh

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo -n " (${ref#refs/heads/}"
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo -n '*'
  echo -n ")"
}

local return_code="%(?..%B%F{red}↵%f%b)"

[[ $USERNAME != "ariofrio" ]] && local username='%n@'
PROMPT='${debian_chroot:+($debian_chroot)}'
PROMPT+='%F{blue}$username%M%f : '
PROMPT+='%B%F{green}%~%b'
PROMPT+='$(git_prompt_info)%f'
PROMPT+=' ${return_code}
%B%F{black}❯%b%f '

volume() {
  case $1 in
    "")
      sink=`pacmd info|grep "Default sink name"|awk '{print $4}'`
      volume=`pacmd list-sinks|grep -A 6 $sink|awk 'NR==7{print $3}'|sed '{s/%//}'`
      echo $[ $volume * 65535 / 100 / 1000 ]
      ;;
    +*|-*)
      volume $[ $(volume)$1 ]
      ;;
    *)
      pacmd set-sink-volume 0 $[ $1 * 1000 ]
      ;;
  esac
}

alias cls=clear

[ -x $(which hub) ] && alias git=hub
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

