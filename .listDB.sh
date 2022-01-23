#!/bin/bash

# check if DB_shell has databases or not 
has_dbs=$(ls -d */)
if [ "$has_dbs" ]; then
echo " There Are Databases I "
    ls -d */
else
    echo "There is no databases to show!"
    
fi
echo
. ./.menu.sh

