#Instalar elementary tweaks

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:philip.scott/elementary-tweaks -y
sudo add-apt-repository ppa:linrunner/tlp -y
sudo add-apt-repository ppa:linuxuprising/apps -y

#Instalar
sudo apt update
sudo apt install software-properties-gtk -y
sudo apt install synaptic -y
sudo apt install snapd -y
sudo apt install elementary-tweaks -y
sudo apt-get install tlp tlp-rdw -y
sudo tlp start
sudo apt install vlc -y
sudo apt-get install flashplugin-installer pepperflashplugin-nonfree -y
sudo apt install software-updater -y
sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip -y
sudo apt-get install qbittorrent -y
sudo apt install steam -y
sudo apt install wine -y
sudo apt install gdebi -y
sudo apt install openjdk-14-jdk -y
sudo apt install maven -y
sudo apt install virtualbox -y
sudo apt install qbittorrent -y
sudo apt install gparted filezilla -y
sudo apt install sqlite3 -y
sudo apt install exfat-fuse exfat-utils -y
sudo apt install git gitk git-gui git-flow -y
sudo apt-get install tlp tlp-rdw -y
sudo tlp start
sudo apt install tlpui -y
sudo apt install telegram-desktop -y
sudo apt install flameshot -y
sudo apt install steam-installer -y
sudo snap install discord
sudo snap install spotify
sudo snap install code --classic
sudo snap install photogimp
sudo snap install node --channel=13/stable --classic
sudo snap install sublime-text --classic
sudo snap install riot-web
sudo snap install insomnia
sudo apt install ubuntu-restricted-extras -y
sudo apt install libavcodec-extra -y
sudo apt install libdvd-pkg -y
sudo apt install python3-virtualenv python3-dev -y
sudo apt install build-essential -y
sudo apt install python3-pip -y

# Google Chrome stable
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable

# Set python 3.6.x as default.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 17
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 9
sudo update-alternatives --config python

# accelerate startup
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disabled

# update graphics drivers
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# fix samba
sudo chmod 744 /usr/lib/gvfs/gvfsd-smb-browse

# clean
sudo apt autoremove
sudo apt -y autoclean
sudo apt -y clean
