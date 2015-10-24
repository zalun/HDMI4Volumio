# Text mode in 800x480 resolution
sudo cp ./config.txt /boot/

# Install 
# https://volumio.org/forum/headroom-left-volumio-t848.html
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install xserver-xorg xserver-xorg-core xfonts-base xinit xserver-xorg-input-evdev
sudo apt-get install lightdm midori matchbox

# on mood this was needed
sudo mkdir /home/pi
sudo chown pi:users /home/pi

# set the ability to run X to "anybody"
sudo sed -i 's/allowed_users=console/allowed_users=anybody/'  /etc/X11/Xwrapper.config
# Enable boot to desktop
sudo raspi-config

# it might happen rPi is starting in 2 or 3 mode - we need 5
sudo cp /etc/inittab /etc/inittab.bak
sudo sed -i 's/id:2:initdefault:/id:5:initdefault:/' /etc/inittab
sudo sed -i 's/id:3:initdefault:/id:5:initdefault:/' /etc/inittab

# start website on starting X
cp xinitrc ~/.xinitrc

# TODO: Enable touch if it's not done via USB
