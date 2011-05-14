#!/bin/bash

if [ $# -lt 1 ] || [ $1 != "makelinks" ]; then
  echo
  echo "This script will backup init files and create the following links:"
  echo "  $HOME/.bash/profile => $HOME/.profile"
  echo "  $HOME/.bash/bashrc => $HOME/.bashrc"
  echo "  $HOME/.bash/screenrc => $HOME/.screenrc"
  echo "  $HOME/.bash/logout => $HOME/.bash_logout"
  echo "  $HOME/.bash/aliases => $HOME/.bash_aliases"
  echo
  echo "if you really want to do this,"
  echo "run it again with the 'makelinks' argument:"
  echo "  $0 makelinks"
  echo
  exit 1
fi

#
# depends heavily on repo being at $HOME/.bash
#

for i in profile bashrc screenrc; do
  if [ -f "$HOME/.$i" -a ! -L "$HOME/.$i" ]; then
    mkdir -p $HOME/.bash/tmp
    mv $HOME/.$i $HOME/.bash/tmp
  fi
  ( cd $HOME; ln -sf .bash/$i .$i )
done

