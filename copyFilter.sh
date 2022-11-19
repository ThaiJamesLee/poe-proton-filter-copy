#!/bin/bash
POE_DIR="$HOME/.steam/steam/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/My Documents/My Games/Path of Exile"
EXTRACT_DIR="/tmp/poe-filters"

if [ -d "$POE_DIR" ]; then

  if [ ! -f "$1"]; then
    echo "Error: $1 not found. Can not continue."
    exit 1
  fi
  echo "Unzip $1"
  mkdir "$EXTRACT_DIR"
  unzip -d "$EXTRACT_DIR" $1
  cd "$EXTRACT_DIR"
  ls

  echo "Clean old .filter files"
  cd "$POE_DIR"
  pwd
  rm -r *.filter
  
  echo "Installing config files in ${POE_DIR}..."
  cp -r "$EXTRACT_DIR/." .

  rm -rf "$EXTRACT_DIR"
else
  echo "Error: ${POE_DIR} not found. Can not continue."
  exit 1
fi
