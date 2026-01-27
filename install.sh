#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root (sudo ./install.sh)"
    exit 1
fi

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="quarkn"
REPO_URL="https://raw.githubusercontent.com/quadakr/quarkn/main/quarkn.py"

echo "Checking dependencies..."

# Check python
if ! command -v python3 >/dev/null 2>&1; then
    echo "Error: python3 is not installed."
    exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is not installed."
    exit 1
fi

echo "Installing quarkn..."

# Download
curl -fsSL "$REPO_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "quarkn installed to $INSTALL_DIR/$SCRIPT_NAME"
echo "Run: quarkn --help"
