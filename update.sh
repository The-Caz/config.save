#!/bin/bash
# Get current path for later
startPath=$(pwd)

# Get save savePath
echo "Where do you want to store this stuff?"
echo "(Leave empty to save in current folder)"
read -p "" -r savePath
if [ "$savePath" != "" ]
then
    eval cd $savePath
fi

# config
read -p "Save files from ~/.config? (Yy/Nn)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Delete the current config files, if the user wants it
    read -p "Delete your currently saved ~/.config files first? (Yy/Nn)" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf config/*
    fi

    # Save an array of all the files in the folder and echo them
    index=0
    declare -a listOfItems
    echo "Folders and files in ~/.config:"
    for file in ~/.config/*
    do
        name=$(basename $file)
        index=$((++index))
        echo "${index}. ${name}"
        listOfItems["$index"]="$name"
    done

    # Get the files to be saved and save them
    echo
    echo "-"
    echo "List the files you'd like to save in a comma-seperated numbered list"
    echo "e.g. \"65,1,2,3,6\""
    echo "(Leave blank if none)"
    read -p "" list
    echo
    if [ "$list" != "" ]; then
        IFS=',' read -r -a listArray <<< "$list"
        for element in "${listArray[@]}"
        do
            echo "Saving ${listOfItems[${element}]}..."
            cp -r ~/.config/${listOfItems[${element}]} config
        done
    fi
fi

# local/share
echo
echo "-"
read -p "Save files from ~/.local/share? (Yy/Nn)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Delete the current config files, if the user wants it
    read -p "Delete your currently saved ~/.local/share files first? (Yy/Nn)" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf local_share/*
    fi

    # Save an array of all the files in the folder and echo them
    index=0
    declare -a listOfItems
    echo "Folders and files in ~/.local/share:"
    for file in ~/.local/share/*
    do
        name=$(basename $file)
        index=$((++index))
        echo "${index}. ${name}"
        listOfItems["$index"]="$name"
    done

    # Get the files to be saved and save them
    echo
    echo "-"
    echo "List the files you'd like to save in a comma-seperated numbered list"
    echo "e.g. \"65,1,2,3,6\""
    echo "(Leave blank if none)"
    read -p "" list
    echo
    if [ "$list" != "" ]; then
        IFS=',' read -r -a listArray <<< "$list"
        for element in "${listArray[@]}"
        do
            echo "Saving ${listOfItems[${element}]}..."
            cp -r ~/.local/share/${listOfItems[${element}]} local_share
        done
    fi
fi

cd $startPath
