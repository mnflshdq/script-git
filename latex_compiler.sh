#!/bin/bash
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

function compile()
{
    xelatex -synctex=1 -interaction=nonstopmode $( get_tex_file_name )
    biber $( get_file_name )
    xelatex -synctex=1 -interaction=nonstopmode $( get_tex_file_name )
    echo
    echo "compiling $( get_tex_file_name ) successful"
    echo "$( get_tex_file_name ) at $PWD"
}

if [ $( find_file ) -ne 0 ]; then
    compile
else
    cd ..
    if [ $( find_file ) -ne 0 ]; then
        compile
    else
        cd ..
        if [ $( find_file ) -ne 0 ]; then
            compile
        else
            echo FILE NOT FOUND
        fi
    fi
fi
