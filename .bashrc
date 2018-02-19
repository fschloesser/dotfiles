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
# 1. directory
# 2. symbolic link
# 3. socket
# 4. pipe
# 5. executable
# 6. block special
# 7. character special
# 8. executable with setuid bit set
# 9. executable with setgid bit set
# 10. directory writable to others, with sticky bit
# 11. directory writable to others, without sticky bit
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# g cyan
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background
export LSCOLORS=Gxfxbxdxcxegedabagacad

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

echo "Did you know that:"; whatis $(ls /bin | shuf -n 1)
