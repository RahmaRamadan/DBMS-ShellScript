#!/bin/bash

echo "Connected To Server Please Choose From Options"


    select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit"; do
        case $choice in
        "Create Database") . ./.createDB.sh ;;
        "List Databases") . ./.listDB.sh ;;
        "Connect To Databases") . ./.connectToBD.sh ;;
        "Drop Database") . ./.dropDB.sh ;;
        "Exit") echo "Exit Main Menu" ; break ;;
        *) echo $REPLY is not one of the choices. ;;
        esac
    done

