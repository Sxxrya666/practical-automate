#!/bin/sh

# Exit immediately if any command fails
set -e

# Check if required commands are available
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Error: '$1' command not found. Please install it first."
        sudo apt install $1
        exit 1
    fi
}

check_command wget
check_command unzip
check_command tmux

# Download files with proper error handling
download_file() {
    local url="$1"
    local filename="$2"
    
    echo "Downloading $filename..."
    if ! wget -q --show-progress --content-disposition -O "$filename" "$url"; then
        echo "Error: Failed to download $filename from $url"
        exit 1
    fi
}

# File URLs and names
KRISHNA_URL="https://bit.ly/krishnbhaktigeet"
KRISHNA_ZIP="krishnbhaktigeet-latest.zip"
SHIVA_URL="https://bit.ly/shivbhaktigeet"
SHIVA_ZIP="shivbhaktigeet-latest.zip"

# Download both files
download_file "$KRISHNA_URL" "$KRISHNA_ZIP"
download_file "$SHIVA_URL" "$SHIVA_ZIP"



# Verify zip files
echo "Verifying zip files..."
unzip "$KRISHNA_ZIP"
unzip "$SHIVA_ZIP"

mv bhajangeet-latest/ bhajangeet/
mv bhaktigeet-latest/ bhaktigeet/

# Clean up
echo "Cleaning up..."
rm -f "$KRISHNA_ZIP" "$SHIVA_ZIP"

echo "All operations completed successfully!"

clear
