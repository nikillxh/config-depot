#!/bin/bash

echo "Installing VScodium extensions from packages.txt..........."
while IFS= read -r line; do
  echo "Processing line: $line"
  vscodium --install-extension $line
  # Perform operations on each line
done < packages.txt