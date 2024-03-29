#!/bin/bash

echo "Guided procedure for setting up a RPi"
echo "--------------------------------------------------\n"

echo "Updating the distribution and installed programs"
read -p $'Press enter to continue...\n'
sudo apt update
sudo apt full-upgrade
echo "--------------------------------------------------\n"

echo "Install Minicom"
read -p $'Press enter to continue...\n'
sudo apt install minicom
echo "--------------------------------------------------\n"

echo "Minicom setup will start. Update the following settings"
echo "Set the default serial port to /dev/ttyUSB0"
echo "115200 8N1"
echo "Hardware flow control OFF"
echo "Software flow control ON"
echo "Save as dfl (for default)"
read -p $'Press enter to continue...\n'
sudo minicom -s
echo "--------------------------------------------------\n"

# How do I install the msp430 BSL tools (python 2 and standalone)

echo "Install and setup Tailscale"
read -p $'Press enter to continue...\n'
curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale up
