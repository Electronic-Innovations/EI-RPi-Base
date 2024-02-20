# EI-RPi-Base
How to get an EI flavoured base configuration for a Raspberry Pi setup and running

This project will help you get a RPi up and running for an EI project. The steps that need to occur are
- How to flash a base image to an SD card
- Pick and set the hostname for the computer
- Pick a password (and store it where EI staff can find it)
- Install tailscale
- Check out your project
- Get it running

## Flashing an SD Card
Raspberry Pi provides [instructions](https://www.raspberrypi.com/documentation/computers/getting-started.html) for flashing a card. You are going to need to download the [rpi imager](https://www.raspberrypi.com/software/) onto another computer. The imager is pretty self-explantory. You do want to edit the settings though.

### Settings
You should set a unique and memorable hostname.

Set the username to "pi" and use a unique password. Store the username and password in 1Password. Use the hostname as the name of the service so that it is easy to find.

Add the EI-Wifi credentials so that it is easy to get onto the network.

Change the locale settings for the wifi and data and time.

In Services you should enable SSH with password authentication.

You are then right to flash the SD card.

## First Boot
With the SD card plugged into the RPi it is ready to be turned on. In order to get connected to the RPi you can either
- Use a display, keyboard and mouse
- Allow it to connect to EI-Wifi
- Connect it to a Mac via internet sharing

### EI-Wifi connection
By default the RPi should connect to the EI-Wifi network. You can log into the "EI - ZTE Modem - Exetel" web interface by coing to 192.168.10.1. The username and password are in 1Password. Then in the WLan section you should see a list of all devices that are connected to the modem. You should be able to find the hostname of the RPi in the list. This will allow you to find the IP address that it is using.

### Internet sharing
Using a Mac from the office and an ethernet cable connect the ethernet cable to the Pi and through a thunderbolt connection to the Mac 

Then turn on internet sharing on the Mac through the thunderbolt ethernet port, open a terminal on the Mac and run the command 

	ifconfig

The Pi will be on the bridge100 connection. The IP of the Pi will be the inet: ‘xxx.xxx.x.(x+1)’
In this case the IP for the RPi is 192.168.2.2. (this last digit can increment if this process has been done for a different pi on the same machine so just keep incrementing the last digit by 1 each time).

## SSH Connection
You should now be able to connect to the RPi using SSH. From your terminal you can enter the command 


    ssh pi@192.168.10.200

Once you are logged in you can download the files from this project to help with the rest of the process. On the RPi you should issue the command

    mkdir repos
    cd ./repos
    git clone https://github.com/Electronic-Innovations/EI-RPi-Base.git

## Running the StartUp.sh script
One of the files that is in the cloned repository is StartUp.sh. It is a shell script that steps through setting up the RPi. You can run it with the following commands

    cd ./EI-RPi-Base
    ./StartUp.sh


