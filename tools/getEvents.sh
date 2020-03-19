#!/bin/bash

ls -lh /dev/input/by-path/ | grep joystick | grep event | cut -d'/' -f2 | awk -v prefix="/dev/input/" '{print prefix $0}'
