#!/bin/bash

find . -maxdepth 1 -type f -not -name '*.tex' -not -name '*.pdf' -not -name 'README.md' -not -name '*.cls' -delete
