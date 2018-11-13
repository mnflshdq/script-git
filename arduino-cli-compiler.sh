#!/bin/bash
arduino-cli compile -b $(arduino-cli board list | sed -n -e '2{p;q}' | awk '{print $1}') $PWD
