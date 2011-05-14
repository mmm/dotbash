# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -d $HOME/.bash/bashrc.d ]; then
  for i in $HOME/.bash/bashrc.d/*; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

