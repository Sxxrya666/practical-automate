#!/bin/bash

# First download the animation script and then source it
BLA_SCRIPT="/tmp/bash_loading_animations.sh"
if ! wget -q https://raw.githubusercontent.com/Sxxrya666/practical-automate/main/bash_loading_animations.sh -O "$BLA_SCRIPT"; then
  echo "❌ Failed to download loading animations script"
  exit 1
fi
source "$BLA_SCRIPT"

trap BLA::stop_loading_animation SIGINT
# Exit immediately if any command fails
set -e

# Check if required commands are available
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

check_command wget
check_command unzip

OPTSTRING="d"

devsetup() {
  echo -e "\e[3m\e[1mdev mode enabled!!\e[0m"
  check_command tmux
  echo '  Loading Dev Configs'
  cd && git clone https://github.com/Sxxrya666/wsl-dotfiles
  ls
  echo "installing LazyVim..."
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt update
  check_command neovim
  echo 'Installing zsh..'
  check_command zsh

  echo 'do you want to source tmux conf file? [y/n]: '
  read resp
  if [[ "$resp" == 'y' ]]; then
    echo "Sourcing .tmux.conf file..."
    tmux source-file
    echo 'successfully sourced!'
  fi
}

while getopts ${OPTSTRING} option; do
  case ${option} in
  d)
    BLA::start_loading_animation "${BLA_modern_metro[@]}"
    devsetup
    BLA::stop_loading_animation
    ;;
  *)
    echo "⚠️ Invalid option: -$OPTSTRING"
    exit 1
    ;;
  esac
done

# Download files with proper error handling
download_file() {
  local url="$1"
  local filename="$2"

  BLA::start_loading_animation "${BLA_semi_circle[@]}"
  echo "⬇️ Downloading $filename..."
  if ! wget --show-progress --content-disposition -q -O "$filename" "$url"; then
    BLA::stop_loading_animation
    echo "❌ Error: Failed to download $filename from $url"
    exit 1
  fi
  BLA::stop_loading_animation
}

SHIVA_URL="https://bit.ly/shivbhaktigeet"
SHIVA_ZIP="shiva-bhajans.zip"

# Download both files
download_file "$SHIVA_URL" "$SHIVA_ZIP"

# Create target directories
mkdir -p shiva-bhajans

# Extract files directly to target directories
BLA::start_loading_animation "${BLA_semi_circle[@]}"
echo "   📦 Extracting files..."
unzip -q -o "$SHIVA_ZIP" -d shiva-bhajans/
BLA::stop_loading_animation

# Move contents from any -latest folders to main directory
BLA::start_loading_animation "${BLA_semi_circle[@]}"
for folder in shiva-bhajans; do
  for latest_dir in "$folder"/*-latest/; do
    if [ -d "$latest_dir" ]; then
      echo " 🔄 Moving files in $folder..."
      mv -f "$latest_dir"* "$folder"/
      rm -rf "$latest_dir"
    fi
  done
done
BLA::stop_loading_animation

echo -e "  🧹 Cleaning up..."
rm -f "$SHIVA_ZIP" "$BLA_SCRIPT"

# Final output
echo -e "\n🎉 All operations completed successfully!"

clear
