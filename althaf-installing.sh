#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR :: Please run this script with root privelege"
    exit 1
fi 

    dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is success"
fi


    