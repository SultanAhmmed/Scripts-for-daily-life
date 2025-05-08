#!/bin/bash

# ┌──────────────────────────────────────────────────┐
# │                 All praise to Allah              │
# │                                                  │
# │         🖋️  Script by: Sultan Ahmmed             │
# │        📅  Date: May 8, 2025 : 4:40AM           │
# │                                                  │
# └──────────────────────────────────────────────────┘

clear

VENV_DIR="venv"

# Check for python3.13-venv
if ! dpkg -s python3.13-venv &>/dev/null; then
    if [ "$(id -u)" -ne 0 ]; then
        if command -v sudo &>/dev/null; then
            sudo apt update && sudo apt install -y python3.13-venv
        else
            echo -e "\033[31m[ERROR] Run with sudo command\033[0m"
            exit 1
        fi
    else
        apt update && apt install -y python3.13-venv
    fi
else
    echo -e "\033[32m[INFO] python3.13-venv is already installed.\033[0m"
fi

# Check if virtual environment exists
if [ ! -f "$VENV_DIR/bin/activate" ]; then
    echo -e "\033[33m[INFO] Creating virtual environment...\033[0m"
    python3 -m venv "$VENV_DIR"
fi


source "$VENV_DIR/bin/activate"

# Check required modules are installed
echo -e "\033[33m[INFO] Checking Required modules are installed or Not?...\033[0m"


echo -e "\033[33m[INFO] Checking pip version...\033[0m"
if python3 -m pip install --upgrade pip 2>/dev/null; then
    echo -e "\033[32m[INFO] pip is up-to-date\033[0m"
else
    echo -e "\033[31m[WARNING] Failed to upgrade pip (continuing with current version)\033[0m" >&2
fi

python3 -c "import livereload, colorama, tqdm" 2>/dev/null

if [ $? -ne 0 ]; then
    echo -e "\033[31m[INFO] Required Modules not found, installing...\033[0m"
    pip install livereload colorama tqdm
    clear
else
    echo -e "\033[32m[INFO] Required Modules are already installed.\033[0m"
fi
clear
# Ask user for the folder path
read -p 'Path to folder (e.g., /home/username/Projects): ' SERVE_FOLDER

# Remove the trailing slash if present
SERVE_FOLDER="${SERVE_FOLDER%/}"

# Check if folder exists
if [ ! -d "$SERVE_FOLDER" ]; then
    echo -e "\033[31m[ERROR] The folder does not exist. Exiting...\033[0m"
    read -p "Press any key to exit..."
    exit 1
fi

# Clear the screen
clear

# Run the live server with the provided folder path
if command -v python3 &>/dev/null; then
    python3 live_server.py "$SERVE_FOLDER"
else
    python live_server.py "$SERVE_FOLDER"
fi

read -p "Press any key to Exit..."
