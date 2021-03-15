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
export HISTSIZE=25000
export HISTFILESIZE=25000

###########################
##### Path
###########################
export GOPATH="$HOME/go"
export PATH="/nfs/optimi/usr/bin:${HOME}/.local/bin:/bin:/usr/bin/X11:/usr/local/ssh/bin:$GOPATH/bin:/home/franzi/software/povray/bin:/usr/local/bin"

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

# default editor (for example used by more when you press 'v')
export VISUAL=vim

export CLICOLOR=TRUE
# colors of ls and so on
export LS_COLORS="di=1;34:ln=31:so=36:pi=33:ex=32:bd=1;33;40:cd=1;36;40:su=1;31;40:sg=1;32;40:tw=1;35;40:ow=1;37;40"

## bring back US english
export LANG=en_US.UTF-8
# use english by default, fall back to spanish and then to german
export LANGUAGE=C:en:de:es
# don't set this explicitly for a user - to be used in scripts
# export LC_ALL=C

# somehow the following line breaks scp... TODO
#echo "Did you know that:"; whatis $(ls /bin | shuf -n 1)
trap "~/.bash_logout" exit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/franzi/software/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/franzi/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/franzi/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/franzi/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

