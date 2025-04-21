#!/bin/sh

# Exit immediately if any command fails
set -e

# Update package lists (non-interactively)
sudo apt update -qq

# Check if required commands are available
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Installing $1..."
        if sudo apt install -y "$1" >/dev/null 2>&1; then 
            echo "✅ Successfully installed $1"
        else 
            echo "❌ Failed to install $1. Please install it manually: sudo apt install $1"
            exit 1
        fi
    fi
}

check_command wget
check_command unzip
check_command tmux

# Download files with proper error handling
download_file() {
    local url="$1"
    local filename="$2"
    
    echo "⬇️ Downloading $filename..."
    if ! wget -q --show-progress --content-disposition -O "$filename" "$url"; then
        echo "❌ Error: Failed to download $filename from $url"
        exit 1
    fi
}

# File URLs and names
KRISHNA_URL="https://bit.ly/krishnbhaktigeet"
KRISHNA_ZIP="krishna-bhajans.zip"
SHIVA_URL="https://bit.ly/shivbhaktigeet"
SHIVA_ZIP="shiva-bhajans.zip"

# Download both files
download_file "$KRISHNA_URL" "$KRISHNA_ZIP"
download_file "$SHIVA_URL" "$SHIVA_ZIP"

# Create target directories
mkdir -p krishna-bhajans shiva-bhajans

# Extract files directly to target directories
echo "📦 Extracting files..."
unzip -q -o "$KRISHNA_ZIP" -d krishna-bhajans/
unzip -q -o "$SHIVA_ZIP" -d shiva-bhajans/

# Move contents from any -latest folders to main directory
for folder in krishna-bhajans shiva-bhajans; do
    if [ -d "$folder"/*-latest ]; then
        echo "🔄 Moving files in $folder..."
        mv -f "$folder"/*-latest/* "$folder"/
        rmdir "$folder"/*-latest
    fi
done

# Clean up
echo "🧹 Cleaning up..."
rm -f "$KRISHNA_ZIP" "$SHIVA_ZIP"

# Final output
echo -e "\n🎉 All operations completed successfully!"

clear
