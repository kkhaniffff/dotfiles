[[ $- != *i* ]] && return

set -o vi
export EDITOR=nvim

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend

shopt -s checkwinsize

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

alias vim=nvim
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias df='df -h'
alias du='du -h'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) && echo " ($branch)"
}
PS1='\[\033[32m\]\w\[\033[35m\]$(git_branch)\[\033[00m\] \$ '
