#!/bin/bash

echo "All variables passed in the script: $@"
echo "All variables passed in the script: $*"
echo "Home Directory is: $HOME"
echo "Who is user: $USER"
echo "what is Pwd: $PWD"
sleep 50 &
echo "what is last backgroupd of PID: $!"
echo "what is script name: $0"
echo "PID is: $$"