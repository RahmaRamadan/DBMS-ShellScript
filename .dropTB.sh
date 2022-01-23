#!/bin/bash

# -p prompt output the string PROMPT without a trailing newline before attempting to read
read -p "Enter Table Name To drop: " table_name
meta_data=.$table_name@meta_data

if [ -f "$DB_name/$table_name" ]; then
    echo
    rm -r $DB_name/$table_name
    rm -r $DB_name/$meta_data

    echo "Table Deleted Successfully"
else
    echo
    echo "Table Doesn't Exist!"
fi
