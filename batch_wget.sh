#!/bin/bash

# Check if the user provided a filename
if [ -z "$1" ]; then
  echo "Usage: $0 <file_with_urls>"
  exit 1
fi

# Read each line (URL) from the file and run wget
while IFS= read -r url; do
  # Skip empty lines or lines starting with #
  [[ -z "$url" || "$url" =~ ^# ]] && continue

  echo "Downloading: $url"
  wget "$url"
done < "$1"
