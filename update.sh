#!/bin/bash
declare -a config_files=("albert", "autostart", "blender", "kitty", "Mailspring", "panel-colorizer", "klassy", "kglobalshortcutsrc", "khotkeysrc", "mimeapps.list")
declare -a local_share_files=("albert", "sddm", "kwin", "plasma")

rm -rf config/*
rm -rf local_share/*

echo "Looking for .config folders..."
for dir in ~/.config/*
do
    name=$(basename $dir)

    containsValue="false"
    for i in "${config_files[@]}"
    do
        if [[ ${i//,} == $name ]];
        then
            echo "Found file/folder: ${name}"
            containsValue="true"
        fi
    done

    if [ $containsValue == "true" ]; then
        cp -r $dir config
    fi
done

echo ''
echo "Looking for .local/share folders..."
for dir in ~/.local/share/*
do
    name=$(basename $dir)

    containsValue="false"
    for i in "${local_share_files[@]}"
    do
        if [[ ${i//,} == $name ]];
        then
            echo "Found file/folder: ${name}"
            containsValue="true"
        fi
    done

    if [ $containsValue == "true" ]; then
        cp -r $dir local_share
    fi
done
