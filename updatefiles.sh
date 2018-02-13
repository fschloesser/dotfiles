#/bin/bash

# this script copies all listed dotfiles to the current directory

for FILE in $(cat filelist.txt)
do
    cp ${HOME}/${FILE} ${FILE}
done

crontab -l > crontab.bkup

