#!/bin/bash

arduino-cli upload -b arduino:avr:uno -p /dev/ttyACM0 -vt $1
