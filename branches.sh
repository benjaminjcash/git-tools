#!/bin/bash

branches () {
    branches=$(git branch --format="%(refname:short)")
    current=$(git branch --show-current)
    no_color='\033[0m'
    green='\033[0;32m'
    red='\033[0;31m'

    for line in $branches
        do
            description=$(git config branch.$line.description)
            if [ $line = $current ]
            then
                echo -e "* ${red}${line}${no_color}  ${description}"
            else
                echo -e "${green}${line}${no_color}  ${description}"
            fi
        done
}