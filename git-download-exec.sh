#!/bin/bash

# Define the repository URL and target directory
REPO_URL="https://github.com/SophieGrig/linux-backup.git"
TARGET_DIR="$HOME/custom-commands"

# Clone the repository into the target directory
git clone "$REPO_URL" "$TARGET_DIR" || { echo "Failed to clone the repository."; exit 1; }

# Change to the target directory
cd "$TARGET_DIR" || { echo "Failed to access $TARGET_DIR."; exit 1; }

# Make all files inside the directory executable
chmod +x *

# Confirm completion
echo "All files in $TARGET_DIR are now executable."
