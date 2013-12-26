#!/bin/bash

DIR=$(dirname $0)

cd $DIR
for i in $(find bash -type f -print) ;
do
    ln -s "$PWD/$i" $HOME
done
