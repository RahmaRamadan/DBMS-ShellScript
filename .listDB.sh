#!/bin/bash

# check if DB_shell has databases or not 
has_dbs=$(ls /home/$LOGNAME/DB_shell)
if [ "$has_dbs" ]; then
    ls `/home/$LOGNAME/DB_shell` 
else
    echo "There is no databases to show!"
fi
