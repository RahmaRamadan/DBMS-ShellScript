#!/bin/bash

echo "Tables Avalaible In Database : "
. ./.listTB.sh

read -p "Enter Table Name To Delete From : " table_name
# Check if table existed
if [[ -f $DB_name/$table_name ]]; then
    echo
    echo "Table is Existed!"
    #Check if table empty or full of data
    # if [ -s "$table_name" ]; then
    # Table is full so select how you want to delete it
    echo "choose from delete ways: "
    select choice in "Delete All" "Delete using PK" "Exit"; do
        case $choice in
        "Delete All")
            #Delete All and overwrite on it
            echo "" >$DB_name/$table_name
            echo "File Content Deleted Successfully"
            ;;

        "Delete using PK")
            read -p "Enter the primary key: " pk
            Record_no=$(awk -F ":" '{if($1=="'$pk'") print "Primary_key_exist" }' $DB_name/$table_name)

            # Check if Primary existed
            if [ "$Record_no" = "Primary_key_exist" ]; then
                Record_no=$(awk -F ":" '{if($1=="'$pk'") print NR}' $DB_name/$table_name)
                sed -i ''$Record_no'd' $DB_name/$table_name
                echo "File Record Deleted Successfully"

            else
                echo "Primary key doesn't exist !! "
            fi
            ;;
        "Exit")
            echo "Switched To Connect Database Menu"
            . ./.connectToBD.sh
            ;;

        *) echo "not in the choice" ;;

        esac
    done

  
else
    echo "Table is not Existed !!"
fi
