#!/bin/bash

# Define the repository URL and target directory
REPO_URL="https://github.com/SophieGrig/linux-backup.git"
TARGET_DIR="$HOME/linux-backup"

# Clone the repository into the target directory
git clone "$REPO_URL" "$TARGET_DIR" || { echo "Failed to clone the repository."; exit 1; }

# Make all files inside the custom-commands directory executable
chmod +x "$TARGET_DIR/custom-commands"/*

# Confirm completion
echo "All files in $TARGET_DIR/custom-commands are now executable."
