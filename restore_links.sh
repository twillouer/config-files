#!/bin/bash

DIR=$(dirname $0)

cd $DIR
for i in $(find bash -type f -print) ;
do
    ln -s "$PWD/$i" $HOME
done

for i in $(find git -type f -print) ;
do
    ln -s "$PWD/$i" $HOME
done

ln -s "$PWD/.screenrc" $HOME
