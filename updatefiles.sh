#/bin/bash

# this script copies all listed dotfiles to the current directory

FILES=".bashrc .bash_logout .bash_profile .git_completion.sh .gitconfig .git_prompt.sh .inputrc .profile .Xmodmap .xinitrc .vim/vimrc .config/i3/config .config/terminator/config .Xresources .bash_colors .regular/adjustbrightness.sh .bash_commands"

for FILE in ${FILES}
do
    cp ${HOME}/${FILE} ${FILE}
done

crontab -l > crontab.bkup

