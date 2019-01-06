#!/bin/bash

# no color
nc='\033[0m'
# light green
green='\033[1;32m'

function delete()
{
find . -maxdepth 1 -type f -name '*.aux' -name '*.bcf' -name '*.log' -name '*.bbl' -name '*.blg' -name '*.out' -name '*.xml' -name '*.gz' -delete
printf "${green}DELETED${nc}"
}

function find_file()
{
    ack -n 'begin\{document\}' | wc -l
}

function get_tex_file_name()
{
    echo $(ack -n 'begin\{document\}' | cut -f 1 -d ':')
}

function get_file_name()
{
    echo $(ack -n 'begin\{document\}' | cut -f 1 -d ':' | cut -f 1 -d '.')
}

cd $1
if [ $( find_file ) -ne 0 ]; then
    delete
else
    cd ..
    if [ $( find_file ) -ne 0 ]; then
        delete
    else
        cd ..
        if [ $( find_file ) -ne 0 ]; then
            delete
        else
            echo FILE NOT FOUND
        fi
    fi
fi
