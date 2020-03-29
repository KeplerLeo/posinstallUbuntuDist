#!/usr/bin/env bash
# ----------------------------- Variables ----------------------------- #
PPA_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# Requirement #
sudo apt install software-properties-common --no-install-recommends -y

PROGRAMAS_PARA_INSTALAR=(
  snapd
  vlc
  synaptic
  virtualbox
  flameshot
  steam-installer
  steam-devices
  steam:i386
  lutris
  libvulkan1
  libvulkan1:i386
  libgnutls30:i386
  libldap-2.4-2:i386
  libgpg-error0:i386
  libxml2:i386
  libasound2-plugins:i386
  libsdl2-2.0-0:i386
  libfreetype6:i386
  libdbus-1-3:i386
  libsqlite3-0:i386
  ubuntu-restricted-extras
  libavcodec-extra
  ffmpeg
  rar
  unrar
  zip
  unzip
  xz-utils
  p7zip-full
  p7zip-rar
  sharutils
  file-roller
  qbittorrent
  gparted
  filezilla
  sqlite3
  exfat-fuse
  exfat-utils
  git
  gitk
  git-gui
  git-flow
  tlp
  tlp-rdw
  tlpui
  python3
  python-pip
  python3-virtualenv
  python3-dev
  build-essential
  python3-pip
  elementary-tweaks
  acpi-call-dkms
  tp-smapi-dkms
  remmina
  libssl-dev
)

## Remove locks ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Add 32bits architecture  ##
sudo dpkg --add-architecture i386

## Att o repository ##
sudo apt update -y

## Add repository##
sudo apt-add-repository "$PPA_LIBRATBAG" -y
sudo add-apt-repository "$PPA_LUTRIS" -y
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"
sudo add-apt-repository ppa:philip.scott/elementary-tweaks -y
sudo add-apt-repository ppa:linuxuprising/apps -y
# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #
## Att o repository ##
sudo apt update -y

## Download and install deb packages ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# Apt install
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## Install snaps ##
sudo snap install snap-store
sudo snap install spotify
sudo snap install code --classic
sudo snap install node --channel=13/stable --classic
sudo snap install photogimp
sudo snap install discord
sudo snap install telegram-desktop
sudo snap install sublime-text --classic
sudo snap install insomnia

# Configs #
# Set python 3.6.x as default.
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 17
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 9
sudo update-alternatives --config python
# and choose 3.6.9

# enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

# disable single click in pantheon
gsettings set io.elementary.files.preferences single-click false

# accelerate startup
sudo mv /etc/xdg/autostart/at-spi-dbus-bus.desktop /etc/xdg/autostart/at-spi-dbus-bus.disabled

# update graphics drivers
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# fix samba
sudo chmod 744 /usr/lib/gvfs/gvfsd-smb-browse

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
