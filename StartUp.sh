#!/bin/sh

line = "--------------------------------------------------"

echo "Guided procedure for setting up a RPi"
echo $line

echo "Updating the distribution and installed programs"
read "Press key to continue"
sudo apt update
sudo apt full-upgrade

echo "Install Minicom"
sudo apt install minicom

echo "Set the default serial port to /dev/ttyUSB0"
echo "115200 8N1"
echo "Hardware flow control OFF"
echo "Software flow control ON"
echo "Save as dfl (for default)"
sudo minicom -s



echo "Install Tailscale"
curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale up
