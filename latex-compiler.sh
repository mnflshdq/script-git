# compile latex main file

#!/bin/bash

# Get main tex filename by searching "begin{document}" function
filenametex=$(grep -r 'begin{document}' ./*.tex /dev/null | cut -f 1 -d ':' | cut -f 2 -d '/')
filename=$(grep -r 'begin{document}' ./*.tex /dev/null | cut -f 1 -d ':' | cut -f 2 -d '/' | cut -f 1 -d '.')
filenametex1=$(grep -r 'begin{document}' ../*.tex /dev/null | cut -f 1 -d ':' | cut -f 2 -d '/')
filename1=$(grep -r 'begin{document}' ../*.tex /dev/null | cut -f 1 -d ':' | cut -f 2 -d '/' | cut -f 1 -d '.')
filenametex2=$(grep -r 'begin{document}' ../../*.tex /dev/null | cut -f 1 -d ':' | cut -f 3 -d '/')
filename2=$(grep -r 'begin{document}' ../../*.tex /dev/null | cut -f 1 -d ':' | cut -f 3 -d '/' | cut -f 1 -d '.')

# If there is main file in current directory
if grep -rq 'begin{document}' ./*.tex; then
    xelatex -synctex=1 -interaction=nonstopmode $filenametex
    biber $filename
    xelatex -synctex=1 -interaction=nonstopmode $filenametex
    echo "YOU'RE AT: $PWD"
    echo "TEX FILE FOUND: $filenametex"
    echo "FILE NAME FOUND: $filename"
# If not go back 1 directory
elif grep -rq 'begin{document}' ../*.tex; then
    cd ..
    xelatex -synctex=1 -interaction=nonstopmode $filenametex1
    biber $filename1
    xelatex -synctex=1 -interaction=nonstopmode $filenametex1
    echo "YOU'RE AT: $PWD"
    echo "TEX FILE FOUND: $filenametex1"
    echo "TEX FILE FOUND: $filename1"
    cd -
# If not go back 2 directories
elif grep -rq 'begin{document}' ../../*.tex; then
    cd ../..
    xelatex -synctex=1 -interaction=nonstopmode $filenametex2
    biber $filename2
    xelatex -synctex=1 -interaction=nonstopmode $filenametex2
    echo "YOU'RE AT: $PWD"
    echo "TEX FILE FOUND: $filenametex2"
    echo "FILE  NAME FOUND: $filenametex2"
    cd -
else
    :
fi
