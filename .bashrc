#! /bin/bash

if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

#

# Bash includes filenames beginning with a ‘.’ in the results of filename expansion
shopt -s dotglob
# If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend
# length of history
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=5000

###########################
##### Path
###########################
export PATH="./:${HOME}/.local/bin:/usr/local/bin:/bin:/usr/bin:/usr/ucb:/usr/bin/X11:/usr/local/ssh/bin:/client/bin:"

export INPUTRC=~/.inputrc

###########################
##### Aliases  
###########################
shopt -s expand_aliases

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

source ~/.bash_aliases

###########################
##### configure prompt
###########################

# load git prompt
source ~/.git_prompt.sh
# load git completion
source ~/.git_completion.sh

# set bef = '<'\!'>'
export GIT_REF="sh -c 'git describe --all 2> /dev/null' | sed 's|\([^/]*\)/\([^.]*\).*|(\2)|'"
alias precmd='set prompt="%B%n@%m [%P] %{\033[34m%}%~ %{\033[31m%}`$GIT_REF`%{\033[60m%} \n ${bef} "'
export BCFG_BLACK=30
export BCFG_RED=31
export BCFG_GREEN=32
export BCFG_YELLOW=33
export BCFG_BLUE=34
export BCFG_PURPLE=35
export BCFG_CYAN=36
export BCFG_WHITE=37

if git --version &>/dev/null;
then
   PS1='\n\[\e[1;${BCFG_BLACK}m\]\u@\h:[\D{%d.%m.%y} - \t]\[\e[m\] \[\e[1;${BCFG_BLUE}m\]\w\[\e[m\] \[\e[1;${BCFG_RED}m\]$(__git_ps1 "(%s)")\[\e[m\]\n\[\e[1;${BCFG_PURPLE}m\]>>\[\e[m\] '
else
   PS1='\n\[\e[1;${BCFG_BLACK}m\]\u@\h:[\D{%d.%m.%y} - \t]\[\e[m\] \[\e[1;${BCFG_BLUE}m\]\w\[\e[m\]\n\[\e[0;${BCFG_PURPLE}m\]>>\[\e[m\] '
fi

###########################
##### 
###########################
bind '"\e[1;5D": backward-word' # ~ for xterm
bind '"\e[1;5C": forward-word'
bind '"\e[5;5~":menu-complete-backward'         # Ctrl-PageDown
bind '"\e[6;5~":menu-complete'                  # Ctrl-PageUp
#
#
# set filec
# set autolist
# set nobeep
# set complete = enhance

###########################
##### Keyboard
###########################
# set american keyboard layout 
setxkbmap us
# make capslock yet another ctrl
setxkbmap -option ctrl:nocaps
# use xmodmap to configure easy German umlauts and sharp s
xmodmap ~/.Xmodmap
