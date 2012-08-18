#!/bin/bash
# creates links in the parent directory to all dotfiles in this directory.
# HAS to be run in this directory

# 4 question marks as a hack not to include .git in the linking process...
# however any dotfiles with only 3 characters in their names will not be linked
# so far not a problem :P
for file in .????*; do ln -s dotfiles/$file ../$file; done
