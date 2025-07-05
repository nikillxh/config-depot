#!/bin/bash

# Update script

process_file() {
  local file="$1"
  if [[ -f "$file" ]]; then
    echo "Updating: $file"
    chmod u+x "$file"
    cp "$file" "$DEST"
  else
    echo "Skipped (file not present): $file"
  fi
}

# Directory to move updated files
DEST="$HOME/.wrapper"

# Ensure destination exists
mkdir -p "$DEST"

# === BASH ===
if [[ -n "$BASH_VERSION" ]]; then
  if ! grep -q 'export PATH="$HOME/.wrapper:$PATH"' "$HOME/.bashrc"; then
    echo "Adding ~/.wrapper to PATH in .bashrc..."
    echo 'export PATH="$HOME/.wrapper:$PATH"' >> "$HOME/.bashrc"
  fi
  export PATH="$HOME/.wrapper:$PATH"
fi

# === FISH ===
if command -v fish >/dev/null; then
  if ! fish -c 'echo $PATH' | grep -q "$WRAPPER_PATH"; then
    echo "Adding ~/.wrapper to PATH in fish..."
    fish -c "set -U fish_user_paths $WRAPPER_PATH \$fish_user_paths"
  fi
fi

# === Confirm ===
echo "PATH is now: $PATH"

# If no arguments, process all regular files in current dir
if [[ $# -eq 0 ]]; then
  for file in *; do
    [[ -f "$file" ]] && process_file "$file"
  done
else
  for file in "$@"; do
    process_file "$file"
  done
fi