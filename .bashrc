#! /bin/bash

if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

##########################
##### USER SPECIFIC
##########################
# this command is generating the tagsfile for vim.
# ctags -R -o ~/.TAGS ~/git ~/projects
# However this could take a while. To make it an hourly cronjob with this:
# * 1 * * * ctags -R -o ~/.TAGS ~/git ~/projects
# To set it up, you could use 'crontab -l', 'crontab -e', and 'crontab -r'

##########################
##### history and terminal
##########################
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
export GOPATH="$HOME/go"
export PATH="./:${HOME}/.local/bin:/usr/local/bin:/bin:/usr/bin:/usr/ucb:/usr/bin/X11:/usr/local/ssh/bin:/client/bin:$GOROOT/bin:$GOPATH/bin"

export INPUTRC=~/.inputrc

###########################
##### Aliases
###########################
shopt -s expand_aliases

alias setbrightness="xrandr --output eDP-1 --brightness "
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias l='ls --color=auto'
alias back='cd -'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias grep='grep -I --color -n'
alias rgrep='rgrep -I --color -n'
alias igrep='grep -i -I --color -n'
alias rigrep='rgrep -i -I --color -n'
alias egrep='egrep --color -I -n'
alias fgrep='fgrep --color -I -n'
alias sourcebashrc='source ~/.bashrc'

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

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
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
    if [ $EXIT != 0 ]; then
        PS1+=${PS_PRE}'38;5;161'${PS_POS}${EXIT}${PS_ENDCOLOR}
    else
        PS1+=${PS_PRE}'38;5;30'${PS_POS}${EXIT}${PS_ENDCOLOR}
    fi
    PS1+=${PS_PRE}'38;5;16'${PS_POS}' >> '${PS_ENDCOLOR}
}

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

