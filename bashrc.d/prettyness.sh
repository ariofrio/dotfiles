
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

git_info() {
  branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -z $branch ]; then # detached head
    branch=$(git name-rev --name-only HEAD 2> /dev/null)
  fi

  tracking=$(git branch -vv 2> /dev/null |
    egrep '^\* +[^ ]+ +[^ ]+ +\[.*: .*\]' |
    sed -r -e 's/^\* +[^ ]+ +[^ ]+ +\[.*: (.*)\].*$/\1/' \
      -e 's/ahead /↑/' -e 's/, //' -e s'/behind /↓/' )

  staged=$(git diff --staged --name-status 2> /dev/null | wc -l)
  unstaged=$(git diff --name-status 2> /dev/null | wc -l)
  untracked=$(git status --porcelain 2> /dev/null |
    grep '^?? ' | wc -l)
  unmerged=$(git status --porcelain 2> /dev/null |
    grep '^(U.|.U) ' | wc -l)

  total=$(git status --porcelain 2> /dev/null | wc -l)
  unknown=$[ $total - $staged - $unstaged - $untracked - $unmerged ]

  if [ $staged -gt 0 ] || [ $unstaged -gt 0 ] ||
  [ $unmerged -gt 0 ] || [ $untracked -gt 0 ] ||
  [ $unknown -ne 0 ]; then
    numbers=1
  else
    numbers=
  fi

  if [ -n "$branch" ] || [ -n "$tracking" ] ||
  [ -n "$numbers" ]; then
    echo -n ' ('

    [ -n "$branch" ] && echo -n $branch
    [ -z "$branch" ] && echo -n "none"

    tput setf 5
    echo -n "$tracking"
    tput sgr0

    tput bold
    [ $staged -gt 0 ] && echo -n " •$staged"
    [ $unstaged -gt 0 ] && echo -n " +$unstaged"
    [ $unmerged -gt 0 ] && echo -n " x${unmerged}"
    [ $untracked -gt 0 ] && echo -n " !$untracked"
    [ $unknown -ne 0 ] && echo -n " _$unknown"
    tput sgr0

    echo -n ')'
  fi
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}'

  PS1+='\[\e[34m\]'
  PS1+='$([ "\u" = ariofrio ] || echo -n "\u@")'
  PS1+='\h'
  PS1+='\[\e[00m\] : '

  PS1+='\[\e[1;32m\]\w\[\e[00m\]'
  PS1+='$(git_info)'
  PS1+='\n> '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h : \w\n> '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy color-enabled aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
