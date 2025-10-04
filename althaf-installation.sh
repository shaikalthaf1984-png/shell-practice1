#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR :: Please run this script with root privelege"
    exit 1
fi 

    VALIDATE(){
        if [ $1 -ne 0 ]; then
    echo "ERROR :: Installing $2 is failure"
    exit 1
        else
    echo "Installing $2 is success"
fi

    }


    dnf install mysql -y
    VALIDATE $? "mysql"

    dnf install nginx -y
    VALIDATE $? "nginx"

    dnf install python3 -y
    VALIDATE $? "python3"


