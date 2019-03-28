#!/bin/bash

install_location=~/.local/lib/wireshark/plugins
echo "Install location $install_location"

mkdir -p $install_location

FOLDERS=(CME)

for dirname in ${FOLDERS[@]}; do
    echo "Installing plugins for $dirname"

    for plugin in ./${dirname}/*.lua; do
        plugin=`realpath $plugin`
        filename=`basename $plugin`
        target=${install_location}/${filename}
        echo "Install $filename to $target..."
        ln -s $plugin $target
    done
done
exit 0
