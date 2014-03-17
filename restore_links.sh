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

if [ ! -d ~/.oh-my-zsh ] ;
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ ! -d ~/.vim ] ;
then
  git clone git@github.com:twillouer/vim-config.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
fi
