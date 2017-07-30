#!/bin/bash
for D in {3,9}{0..7};
do
    for E in {4,10}{0..7};
    do
        echo -en "\e[0;${D};${E}m[0;${D};${E}]";
    done
    echo ""
done
for C in '48;5' '38;5';
do
    echo -e ""
    for D in {1..25};
    do
        echo -e ""
        for E in 6 7 8 9 0 1 2 3 4 5;
        do
            echo -en "\e[0;30;47m"
            echo -en "\e[${C};${D}${E}m[${C};${D}${E}]";
            echo -en "\e[0;37;40m"
            echo -en "\e[${C};${D}${E}m[${C};${D}${E}]";
        done
    done
done
