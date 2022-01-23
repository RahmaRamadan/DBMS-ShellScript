#!/bin/bash

read -p "Enter Table Name To Insert Into It : " table_name
meta_data=.$table_name@meta_data

if [[ -f $DB_name/$table_name ]]; then

    colsNum=$(awk 'BEGIN{FS=":"}{if(NR == 1) print NF}' $DB_name/$meta_data)

    # echo $colsNum
    #check if file is empty or not

    if [[ -s $DB_name/$table_name ]]; then
        ID=$(tail -1 $DB_name/$table_name | cut -d':' -f1)
        # echo "ID : $ID"
        auto_incremnt=$(($ID + 1))
        # echo " auto : $auto_incremnt"
        echo -n "$auto_incremnt:" >>$DB_name/$table_name
    else
        echo -n "1:" >>$DB_name/$table_name

    fi

    # for (( $i; $i -le $colsNum; $i=$i+1 )); do

    # column_name=$(awk 'BEGIN{FS=":"}{ if(NF=='$i') print $1}' "$DB_name/$meta_data")
    for i in $(seq 2 $colsNum); do
        # get the fields names from the table
        fieldName=$(awk 'BEGIN{FS=":"}{if(NR == 1) print $'$i'}' $DB_name/$meta_data)
        # echo $fieldName
        colType=$(awk 'BEGIN{FS=":"}{if(NR == 2) print $'$i'}' $DB_name/$meta_data)
        read -p "Enter $fieldName To Insert Into It : " column_value

        # echo $i
        # echo $colsNum

        if [ $i -eq $colsNum ]; then
            echo -n "$column_value" >>$DB_name/$table_name
        else
            echo -n "$column_value:" >>$DB_name/$table_name
        fi

    done
    echo >>$DB_name/$table_name

else
    echo "File Doesn't exist"
fi
