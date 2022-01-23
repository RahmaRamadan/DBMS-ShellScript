#!/bin/bash

# -p prompt output the string PROMPT without a trailing newline before attempting to read
read -p "Enter Table Name: " table_name

meta_data=.$table_name@meta_data

if [ -d "$DB_name/$table_name" ]; then
    echo
    echo "Table Already Exists!"
else
    touch $DB_name/$table_name
    touch $DB_name/$meta_data

    echo
    echo "Table Created Successfully"
    echo
    #---------------------------------------------------------
    #---------------------------------------------------------
    echo -n "@PK.id:" >>$DB_name/$meta_data

    read -p "How many fields in the table? " fields_no #field=3
    for ((c = 1; c <= $fields_no; ((c++)))); do

        echo "Enter Field no.$c Name: "

        read field

        if [ $c = $fields_no ]; then
            echo -n "$field" >>$DB_name/$meta_data
        else
            echo -n "$field:" >>$DB_name/$meta_data
        fi
    done
    #start new line in table file
    echo >>$DB_name/$meta_data

    echo -n "int:" >>$DB_name/$meta_data

    for ((i = 1; i <= $fields_no; ((i++)))); do
        echo "Enter Field no.$i Datatype: "
        #read datatype

        if [ $i = $fields_no ]; then
            select datatype in "int" "varchar" "date" "Exit"; do
                case $datatype in
                "int" | "varchar" | "date")
                    echo -n "$datatype" >>$DB_name/$meta_data
                    break
                    ;;
                "Exit") echo "Switched To Table Menu , Please Press Enter To Show Menu " ; break ;;
                *) echo $REPLY is not one of the choices. ;;
                esac
            done
        else
            select datatype in "int" "varchar" "date" "Exit"; do
                case $datatype in
                "int" | "varchar" | "date")
                    echo -n "$datatype:" >>$DB_name/$meta_data
                    break
                    ;;
                "Exit")  break ;;
                *) echo $REPLY is not one of the choices. ;;
                esac
            done
        fi
    done

fi
