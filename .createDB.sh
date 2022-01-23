#!/bin/bash

# -p prompt output the string PROMPT without a trailing newline before attempting to read
read -p "Enter Database Name: " DB_name

# check if database exists before or not
if [ -d "$DB_name" ]; then
    echo
    echo "Database Already Exists!"
else
    mkdir $DB_name
    echo
    echo "Database Created Successfully"
fi
echo
. ./.menu.sh

