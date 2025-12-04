#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Run the script with sudo"
  exit 1
fi

HOME_DIR="$HOME"
DESKTOP_DIR="$HOME/Desktop"
SECLISTS_DIR="$HOME_DIR/seclists"

echo "Starting install"

apt update

echo "Go, Rust, Python3-pip, Ruby, curl, git, wget"
apt install -y golang-go rustc cargo python3-pip ruby-full curl git wget

echo "pip pip"
pip3 install --upgrade pip

# linpeas.sh, place on Desktop?
echo "Installing linpeas.sh to Desktop..."
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o "$DESKTOP_DIR/linpeas.sh"
chmod +x "$DESKTOP_DIR/linpeas.sh"

# okteta + desktop icon?
echo "ok ok"
apt install -y okteta
cat > "$DESKTOP_DIR/okteta.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Okteta
Comment=Hex Editor
Exec=okteta %F
Icon=okteta
Terminal=false
Categories=Utility;Development;
EOF
chmod +x "$DESKTOP_DIR/okteta.desktop"
chown $SUDO_USER:$SUDO_USER "$DESKTOP_DIR/okteta.desktop"

# code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt update
apt install -y code

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# others
pip3 install name-that-hash

apt install -y openvpn

# secLists place in ~/seclists
echo "Installing SecLists to ~/seclists"
if [ -d "$SECLISTS_DIR" ]; then
  echo "directory already exists"
else
  git clone https://github.com/danielmiessler/SecLists.git "$SECLISTS_DIR"
fi

# install and unzip rockyou.txt to home directory
echo "unzipping rockyou.txt to home"
if [ -f "$HOME_DIR/rockyou.txt" ]; then
  echo "rockyou.txt already exists"
else
  if [ -f "/usr/share/wordlists/rockyou.txt.gz" ]; then
    gunzip -c /usr/share/wordlists/rockyou.txt.gz > "$HOME_DIR/rockyou.txt"
  else
    echo "rockyou.txt.gz not found in /usr/share/wordlists/, downloading"
    wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt -O "$HOME_DIR/rockyou.txt"
  fi
fi

# feroxbuster
echo "Fe2O3 :D"
apt install -y feroxbuster

# ffuf 
echo "ffuf u"
go install github.com/ffuf/ffuf/v2@latest
# Go binaries need to be in PATH
if ! command -v ffuf &> /dev/null; then
  cp ~/go/bin/ffuf /usr/local/bin/
fi

# others 2
pip3 install impacket

gem install evil-winrm

echo "poppler-utils, check script for list"
apt install -y poppler-utils

# pdfattach – add a new embedded file (attachment) to an existing PDF
# pdfdetach – extract embedded documents from a PDF
# pdffonts – lists the fonts used in a PDF
# pdfimages – extract all embedded images at native resolution from a PDF
# pdfinfo – list all information of a PDF
# pdfseparate – extract single pages from a PDF
# pdftocairo – convert single pages from a PDF to vector or bitmap formats using cairo
# pdftohtml – convert PDF to HTML format retaining formatting
# pdftoppm – convert a PDF page to a bitmap
# pdftops – convert PDF to printable PS format
# pdftotext – extract all text from PDF
# pdfunite – merges several PDFs
# EXAMPLE - pdftotext file.pdf - | grep string


echo "nuclei"
# nuclei

go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
# Go binaries are in PATH
if ! command -v nuclei &> /dev/null; then
  cp ~/go/bin/nuclei /usr/local/bin/
fi

# linenum
echo "LinEnum"
LINENUM_DIR="$HOME_DIR/LinEnum"
if [ -d "$LINENUM_DIR" ]; then
  echo "LinEnum directory already exists, skipping clone..."
else
  git clone https://github.com/rebootuser/LinEnum.git "$LINENUM_DIR"
fi

# metadata stuff
echo "metadata stuff, steghide, check comments on script"

apt install -y steghide

apt install -y exiftool


# check for exiftool, pdfinfo,
# unrelated web stuff ----curl, strings

apt install -y airgeddon

# final updating
echo "Running final apt update and full-upgrade..."
apt update
apt full-upgrade -y

echo "Cleaning up apt cache..."
apt autoremove -y
apt autoclean

echo "Tools Installed"


#
# APT packages installed:
# - golang-go
# - rustc
# - cargo
# - python3-pip
# - ruby-full
# - curl
# - git
# - wget
# - okteta
# - code (Visual Studio Code via Microsoft repo)
# - openvpn
# - feroxbuster
# - poppler-utils (provides pdftotext, pdfinfo, pdfimages, pdftops, pdftoppm, pdffonts, etc)
# - steghide
#
# exiftool
# - airgeddon

# Direct downloads and manual installs:
# - linpeas.sh downloaded to $HOME/Desktop
# - google-chrome-stable .deb downloaded and installed
#
# pip3 installations:
# - pip upgraded itself
# - name-that-hash
# - impacket
#
# gem installation:
# - evil-winrm
#
# go install commands (installed into $GOPATH/bin, copied to /usr/local/bin if not in PATH):
# - ffuf (github.com/ffuf/ffuf/v2)
# - nuclei (github.com/projectdiscovery/nuclei/v3/cmd/nuclei)
#
# Git repositories cloned:
# - SecLists cloned to ~/seclists from https://github.com/danielmiessler/SecLists.git
# - LinEnum cloned to ~/LinEnum from https://github.com/rebootuser/LinEnum.git
#
# Wordlists and files:
# - rockyou.txt: extracted from /usr/share/wordlists/rockyou.txt.gz if present
#   otherwise downloaded to ~/rockyou.txt from brannondorsey repository
#
# Desktop integration:
# Creates $HOME/Desktop/okteta.desktop for Okteta and sets ownership to the invoking sudo user
#
# Repository and key setup:
# Adds Microsoft GPG key and apt source for Visual Studio Code
#
# System maintenance:
# - apt update
# - apt full-upgrade -y
# - apt autoremove -y
# - apt autoclean

