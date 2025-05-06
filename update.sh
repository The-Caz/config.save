#!/bin/bash
declare -a config_folders=("", "", "", "", "", "")
declare -a local_share_folders=("", "", "", "")

rm -rf config/*
rm -rf local_share/*

echo "Looking for .config folders..."
for dir in ~/.config/*/
do
    name=$(basename $dir)

    containsValue="false"q
    for i in "${config_folders[@]}"
    do
        if [[ ${i//,} == $name ]];
        then
            echo "Found folder: ${name}"
            containsValue="true"
        fi
    done

    if [ $containsValue == "true" ]; then
        cp -r $dir config
    fi
done

echo ''
echo "Looking for .local/share folders..."
for dir in ~/.local/share/*/
do
    name=$(basename $dir)

    containsValue="false"
    for i in "${local_share_folders[@]}"
    do
        if [[ ${i//,} == $name ]];
        then
            echo "Found folder: ${name}"
            containsValue="true"
        fi
    done

    if [ $containsValue == "true" ]; then
        cp -r $dir local_share
    fi
done
