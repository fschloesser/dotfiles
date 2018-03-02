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

# set a terminal of your choice (i.e. terminator, xterm ...)
# sudo update-alternatives --config x-terminal-emulator

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

source ~/.bash_aliases
source ~/.bash_commands

###########################
##### configure prompt
###########################

# load git prompt and colors
source ~/.bash_colors

export CLICOLOR=TRUE
# colors of ls and so on
export LS_COLORS="di=1;34:ln=31:so=36:pi=33:ex=32:bd=1;33;40:cd=1;36;40:su=1;31;40:sg=1;32;40:tw=1;35;40:ow=1;37;40"

## bring back US english
export LANG=en_US.UTF-8
export LANGUAGE=en

echo "Did you know that:"; whatis $(ls /bin | shuf -n 1)
