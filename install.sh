#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPLACE_ALL=false

files=(".vimrc" ".gvimrc" ".vim")

for file in "${files[@]}"; do
  source="$SCRIPT_DIR/$file"
  target="$HOME/$file"

  if [ ! -e "$source" ]; then
    echo " => source $source does not exist, skipping"
    continue
  fi

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    echo " => skipping $target (already linked)"
    continue
  fi

  if [ ! -e "$target" ] && [ ! -L "$target" ]; then
    echo " => symlinking $source to $target"
    ln -s "$source" "$target"
    continue
  fi

  if [ "$REPLACE_ALL" = true ]; then
    echo " => replacing $target with link to $source"
    rm -rf "$target"
    ln -s "$source" "$target"
    continue
  fi

  printf "overwrite? %s [ynaq] " "$target"
  read -r answer
  case "$answer" in
    y)
      echo " => replacing $target with link to $source"
      rm -rf "$target"
      ln -s "$source" "$target"
      ;;
    a)
      REPLACE_ALL=true
      echo " => replacing $target with link to $source"
      rm -rf "$target"
      ln -s "$source" "$target"
      ;;
    q)
      exit 0
      ;;
    *)
      echo " => skipping $target"
      ;;
  esac
done

echo "Done. Open vim and run :call dein#install() to install plugins."
