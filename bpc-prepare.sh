#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Illuminate/Container/
mkdir ./Illuminate/Container/

echo "placeholder-container.php" > ./Illuminate/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Container/$i" >> ./Illuminate/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Illuminate/Container/$i
        else
            echo "cp       $i"
            cp $i ./Illuminate/Container/$i
        fi
    fi
done
cp bpc.conf Makefile ./Illuminate/
