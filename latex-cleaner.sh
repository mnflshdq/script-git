#!/bin/bash

# no color
nc='\033[0m'
# light green
green='\033[1;32m'

function delete()
{
    rm *.aux *.bbl *.blg *.log *.pdf *.gz
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
