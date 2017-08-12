#/bin/bash

# this script copies all listed dotfiles to the current directory

FILES=".bashrc .bash_logout .bash_profile .git_completion.sh .gitconfig .git_prompt.sh .inputrc .profile .Xmodmap"

for FILE in ${FILES}
do
    cp ${HOME}/${FILE} .
done

cp ${HOME}/.vim/vimrc .vim/
