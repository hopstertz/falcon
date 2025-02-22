#!/bin/bash

# Advanced installation script for Falcon in Termux

# Variables
TARGET_DIR="$PREFIX/bin"
SCRIPT_NAME="falcon"

# Function to display error messages
show_error() {
    echo "ERROR: $1"
    exit 1
}

# Start installation
echo "Running installation..."

# Check if the falcon file exists in the current directory
if [[ ! -f "$SCRIPT_NAME" ]]; then
    show_error "'$SCRIPT_NAME' not found in the current directory."
fi

# Move the falcon file to the target directory
echo "Moving '$SCRIPT_NAME' to bin..."
if mv "$SCRIPT_NAME" "$TARGET_DIR/"; then
    echo "Successfully moved '$SCRIPT_NAME'."
else
    show_error "Failed to move '$SCRIPT_NAME'."
fi

# Make the falcon file executable
echo "Setting executable permissions..."
if chmod +x "$TARGET_DIR/$SCRIPT_NAME"; then
    echo "Successfully set executable permissions."
else
    show_error "Failed to set executable permissions."
fi

# Verify installation by running the falcon command
echo "Verifying installation..."
if "$TARGET_DIR/$SCRIPT_NAME"; then
    echo "Installation verified successfully. '$SCRIPT_NAME' is ready to use."
else
    show_error "Verification failed. '$SCRIPT_NAME' may not be functioning correctly."
fi

echo "Installation completed."