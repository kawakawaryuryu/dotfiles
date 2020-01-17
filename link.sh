#!/bin/sh

for file in .??*
do
    if [ $file = ".git" ] || [ $file = ".gitignore" ] || [ $file = ".gitmodules" ]
    then
        continue
    fi

    ln -snf "$HOME/dotfiles/$file" "$HOME/$file"
    #echo $file
done

