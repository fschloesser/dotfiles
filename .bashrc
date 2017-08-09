#! /bin/bash

if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Bash includes filenames beginning with a ‘.’ in the results of filename expansion
shopt -s dotglob
# If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend
# length of history
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=5000
export HISTFILESIZE=5000

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
alias grep='grep --color -n'
alias rgrep='rgrep --color -n'
alias egrep='egrep --color -n'
alias fgrep='fgrep --color -n'

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
PS_PRE='\[\e[1m\e['
PS_POS='m\]'
PS_ENDCOLOR='\[\e[m\]' 

PS_NEWLINE='\n'
PS_USER='\u'
PS_HOST='\h'
PS_DATETIME='[\D{%d.%m.%y} - \t]'
PS_CURRDIR='\w'
PS_GIT='$(__git_ps1 "(%s)")'

PS1=''
PS1+=${PS_NEWLINE}
PS1+=${PS_PRE}'38;5;246'${PS_POS}${PS_DATETIME}' '${PS_ENDCOLOR}
PS1+=${PS_PRE}'38;5;161'${PS_POS}${PS_USER}'@'${PS_HOST}': '${PS_ENDCOLOR}
PS1+=${PS_PRE}'38;5;30'${PS_POS}${PS_CURRDIR}' '${PS_ENDCOLOR}
if git --version &>/dev/null;
then
   PS1+=${PS_PRE}'38;5;105'${PS_POS}${PS_GIT}' '${PS_ENDCOLOR}
else
   PS1+=''
fi
PS1+=${PS_NEWLINE}
PS1+=${PS_PRE}'38;5;16'${PS_POS}'>> '${PS_ENDCOLOR}

# set your terminal background to #dddddd and foreground to #222222

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
# setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap us
# make capslock yet another ctrl
setxkbmap -option ctrl:nocaps
# use xmodmap to configure easy German umlauts and sharp s
xmodmap ~/.Xmodmap
