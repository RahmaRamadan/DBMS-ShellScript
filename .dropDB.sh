#!/bin/bash

# -p prompt output the string PROMPT without a trailing newline before attempting to read
read -p "Enter Database Name To drop: " DB_name

#check if DB_name exists or
if [ -d "$DB_name" ]; then
    # if exists --> delete it
    echo
    rm -r $DB_name
    echo "Database Deleted Successfully"
    
else
    echo
    echo "Database Doesn't Exist!"
    
fi
echo
. ./.menu.sh
