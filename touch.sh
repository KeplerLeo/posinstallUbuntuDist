#Resolvendo bug do touchpad
touch /lib/systemd/system-sleep/touchpad
sudo nano /lib/systemd/system-sleep/touchpad
#!/bin/sh

case $1 in
  post)
    /sbin/rmmod i2c_hid && /sbin/modprobe i2c_hid 
  ;;
esac
