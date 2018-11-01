#!/bin/bash

# no color
nc='\033[0m'
# light green
green='\033[1;32m'

find . -maxdepth 1 -type f -not -name '*.tex' -not -name '*.pdf' -not -name 'README.md' -not -name '*.cls' -not -name '.gitignore' -delete
printf "${green}DELETED${nc}"
