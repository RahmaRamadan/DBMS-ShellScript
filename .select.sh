#!/bin/bash
read -p "Enter Table Name To Select From : " table_name

#Select Statment Options
select choice in "Select All" "Select using PK" "Exit"; do
    case $choice in
    # Select All Records In Table
    "Select All")
        output=$(cat "$DB_name/$table_name")
        for line in $output; do
            echo $line
        done
        echo "All Records Are Selected Successfully In $table_name "

        ;;
        # Select Record With Primary Key In Table

    
        "Select using PK")
        read -p "Enter the primary key: " pk
        ID_exist=$(awk -F ":" '{if($1=="'$pk'") print "Primary_key_exist" }' $DB_name/$table_name)

        # Check if Primary existed
        if [ "$ID_exist" = "Primary_key_exist" ]; then

            Record_no=$(awk -F ":" '{if($1=="'$pk'") print $0}' $DB_name/$table_name)
            echo $Record_no
            echo " Record Is Selected Successfully from $table_name "

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
