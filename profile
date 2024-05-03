# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# prompt leader
export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\h\[\033[00m\]:\w"

if [ -d $HOME/.bash/profile.d ]; then
  for i in $HOME/.bash/profile.d/*; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# prompt trailer
export PS1="$PS1 \\$ "


