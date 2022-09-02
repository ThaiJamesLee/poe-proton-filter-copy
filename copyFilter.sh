#!/bin/bash
POE_DIR="$HOME/.steam/steam/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/My Documents/My Games/Path of Exile"

if [ -d "$POE_DIR" ]; then
  read -p 'Filter ZIP: ' ZIP_FILE

  if [ ! -f "$ZIP_FILE"]; then
    echo "Error: ${ZIP_FILE} not found. Can not continue."
    exit 1
  fi
  cp $ZIP_FILE "$POE_DIR"
  echo "Installing config files in ${POE_DIR}..."
else
  echo "Error: ${POE_DIR} not found. Can not continue."
  exit 1
fi
