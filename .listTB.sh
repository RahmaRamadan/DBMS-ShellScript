#!/bin/bash

# check if DB_name has tables or not
has_tables=$(ls $DB_name)
if [ "$has_tables" ]; then
    echo "There Are Tables In $DB_name "
   ls $DB_name
else
    echo "There is no tables to show!"
fi
