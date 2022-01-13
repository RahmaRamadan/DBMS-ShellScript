#!/bin/bash

# -p prompt output the string PROMPT without a trailing newline before attempting to read
read -p "Enter Database Name: " DB_name

# check if database exists before or not 
if [ -d "/home/$LOGNAME/DB_shell/$DB_name" ]; then
    echo 
    echo "Database Already Exists!"
else
    mkdir /home/$LOGNAME/DB_shell/$DB_name
    echo 
    echo "Database Created Successfully"

fi
