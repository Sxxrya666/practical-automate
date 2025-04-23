#!/bin/bash

# Download and source loading animation script
BLA_SCRIPT="/tmp/bash_loading_animations_$$.sh"
if ! wget -q https://raw.githubusercontent.com/Sxxrya666/practical-automate/main/bash_loading_animations.sh -O "$BLA_SCRIPT"; then
  echo "❌ Failed to download loading animations script"
  exit 1
fi
source "$BLA_SCRIPT"

trap 'BLA::stop_loading_animation; rm -f "$BLA_SCRIPT"' EXIT SIGINT
set -e

# Function to check and install commands
check_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "  Installing $1..."
    if sudo apt install -y "$1" >/dev/null 2>&1; then
      echo "  ✅ Successfully installed $1"
    else
      echo "  ❌ Failed to install $1. Please install it manually: sudo apt install $1"
      exit 1
    fi
  fi
}

# Function to generate sneaky folder names
generate_sneaky_name() {
  local names=("node_modules" "__pycache__" ".cache" ".tmp" "venv" ".venv" "dist" "build" ".git")
  echo "${names[$RANDOM % ${#names[@]}]}"
}

# Function to download and process a single URL
process_url() {
  local url="$1"
  local sneaky_name=$(generate_sneaky_name)
  local filename="$sneaky_name-$(date +%s).zip"

  # Download the file
  BLA::start_loading_animation "${BLA_semi_circle[@]}"
  echo "⬇️ Downloading from $url..."
  if ! wget --show-progress --content-disposition -q -O "$filename" "$url"; then
    BLA::stop_loading_animation
    echo "❌ Error: Failed to download from $url"
    return 1
  fi
  BLA::stop_loading_animation

  # Create sneaky folder
  mkdir -p "$sneaky_name"

  # Extract files
  BLA::start_loading_animation "${BLA_semi_circle[@]}"
  echo "📦 Extracting to $sneaky_name..."
  if ! unzip -q -o "$filename" -d "$sneaky_name"/; then
    BLA::stop_loading_animation
    echo "❌ Failed to extract $filename"
    return 1
  fi
  BLA::stop_loading_animation

  # Process any -latest folders
  BLA::start_loading_animation "${BLA_semi_circle[@]}"
  for latest_dir in "$sneaky_name"/*-latest/; do
    if [ -d "$latest_dir" ]; then
      echo "🔄 Moving files in $sneaky_name..."
      mv -f "$latest_dir"* "$sneaky_name"/
      rm -rf "$latest_dir"
    fi
  done
  BLA::stop_loading_animation

  # Clean up the zip file
  rm -f "$filename"
  echo "✅ Successfully processed $url → $sneaky_name"
}

# Default URLs
DEFAULT_URLS=(
  "https://bit.ly/shivbhaktigeet"
)

# Main script logic
OPTSTRING="de"

while getopts ${OPTSTRING} option; do
  case ${option} in
  d)
    echo -e "\e[3m\e[1mDeveloper mode enabled!\e[0m"
    sudo apt update -qq
    check_command tmux
    check_command neovim
    check_command zsh
    exit 0
    ;;
  e)
    echo -e "\e[3m\e[1mEdit mode enabled!\e[0m"
    echo "🌐 Enter download URLs (one per line, press Ctrl+D when done):"

    # Read multiple URLs until EOF (Ctrl+D)
    urls=()
    while IFS= read -r line; do
      urls+=("$line")
    done

    if [ ${#urls[@]} -eq 0 ]; then
      echo "❌ No URLs provided. Using defaults."
      urls=("${DEFAULT_URLS[@]}")
    fi

    # Process all URLs
    for url in "${urls[@]}"; do
      if [ -n "$url" ]; then # Skip empty lines
        process_url "$url" || continue
      fi
    done
    exit 0
    ;;
  *)
    echo "⚠️ Invalid option: -$OPTARG"
    exit 1
    ;;
  esac
done

# Default mode - process default URLs
echo "🌐 Processing default content..."
for url in "${DEFAULT_URLS[@]}"; do
  process_url "$url" || continue
done

echo -e "\n🎉 All operations completed successfully!"
