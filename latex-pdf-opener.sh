#!/bin/bash

green='\033[1;32m'
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

function open()
{
    evince $( get_file_name ).pdf&
}

cd $1
if [ $( find_file ) -ne 0 ]; then
    open
else
    cd ..
    if [ $( find_file ) -ne 0 ]; then
        open
    else
        cd ..
        if [ $( find_file ) -ne 0 ]; then
            open
        else
            echo FILE NOT FOUND
        fi
    fi
fi
