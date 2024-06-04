#!/bin/bash

while true; do
  read -p "Move 'html' to zip? [y] or [n] " yn
  case $yn in
    [Yy]* )
      cd html &&
      zip -r -u -9 site . -x **/node_modules/\* -x \*-lock\* -x \*.lock\* &&
      mv site.zip ..
      break;;
    [Nn]* ) exit;;
  esac
done