#!/bin/sh

set -e

for f in `git ls-files | grep -v README.md`; do
    if [ -L ../$f ]; then
        rm -f ../$f
    elif [ -f ../$f ]; then
        echo "Backing up the original file to: ../$f.org"
        mv ../$f ../$f.org
    fi

    ln -s dotfiles/$f ../$f
done
