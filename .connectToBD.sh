#!/bin/bash

#like \c database_name in postgresql
read -p "Enter Database Name To Connect: " DB_name

if [ -d "$DB_name" ]; then
    echo "You Connected To $DB_name Succesfully"
    echo
    select choice in "Create Table" "List Tables" "Drop Table" "Insert Into Table" "Select From Table" "Delete From Table" "Exit"; do
        case $choice in
        # first dot to open run commands in the same shell
        "Create Table") . ./.createTB.sh ;;
        "List Tables") . ./.listTB.sh ;;
        "Drop Table") . ./.dropTB.sh ;;
        "Insert Into Table") . ./.insert.sh ;;
        "Select From Table") . ./.select.sh ;;
        "Delete From Table") . ./.deleteFromTable.sh ;;
        "Exit")
            echo "Switched To Main Menu , Please Press Enter To Show Menu"
            echo
            . ./.menu.sh
            break
            ;;
        *) echo $REPLY is not one of the choices. ;;
        esac
    done
else
    echo "Database Doesn't Exist!"
    . ./.menu.sh

fi
