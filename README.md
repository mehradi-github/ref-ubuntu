# Tips to do on fresh install of ubuntu desktop

- [Tips to do on fresh install of ubuntu desktop](#tips-to-do-on-fresh-install-of-ubuntu-desktop)
  - [Install and upgrade packages](#install-and-upgrade-packages)
  - [Adding PPA using APT](#adding-ppa-using-apt)
  - [Installing Git](#installing-git)
  - [Installing necessary packages](#installing-necessary-packages)
  - [Installing flatpak](#installing-flatpak)
  - [Changing TimeOut in GRUB](#changing-timeout-in-grub)
  - [Repairing boot after install windows](#repairing-boot-after-install-windows)
  - [Adding swap after system installation](#adding-swap-after-system-installation)
  - [Enabling AppImage Support in Ubuntu](#enabling-appimage-support-in-ubuntu)
  - [Installing rar/unrar](#installing-rarunrar)
  - [Installing zip/unzip](#installing-zipunzip)
  - [Installing tar](#installing-tar)
  - [Installing Qv2ray](#installing-qv2ray)
  - [Setting proxy on sudo](#setting-proxy-on-sudo)
  - [Setting proxy on NPM](#setting-proxy-on-npm)
  - [Installing pnpm](#installing-pnpm)
  - [Installing V2raya](#installing-v2raya)
  - [Enabling wayland](#enabling-wayland)
  - [Installing Waydroid](#installing-waydroid)
  - [Installing Microsoft fonts](#installing-microsoft-fonts)
  - [Installing Docker](#installing-docker)
  - [Setting proxy on Docker](#setting-proxy-on-docker)
  - [Installing Vscode](#installing-vscode)
  - [Installing Bing wallpaper](#installing-bing-wallpaper)
  - [Installing Pomodoro](#installing-pomodoro)
  - [Fixing error: download is performed unsandboxed as root...](#fixing-error-download-is-performed-unsandboxed-as-root)
  - [Instaling TLP](#instaling-tlp)
  - [Forwarding all traffic from ssh (sshuttle)](#forwarding-all-traffic-from-ssh-sshuttle)
  - [Installing Minikube](#installing-minikube)
  - [Installing MicroK8s](#installing-microk8s)
  - [Install inside virtual environment:](#install-inside-virtual-environment)
  - [Installing Brave browser](#installing-brave-browser)
  - [Installing Node.js LTS via binary archive](#installing-nodejs-lts-via-binary-archive)
  - [Tips](#tips)
  - [Modifing style properties of GNOME Shell themes](#modifing-style-properties-of-gnome-shell-themes)
    - [Generating custom theme and changing panel background color](#generating-custom-theme-and-changing-panel-background-color)
    - [Extracting original CSS file as a reference](#extracting-original-css-file-as-a-reference)
  - [Zsh](#zsh)
    - [Oh my zsh](#oh-my-zsh)
  - [Changing Defualt Shell](#changing-defualt-shell)
  - [Remount filesystem in the read-write mode](#remount-filesystem-in-the-read-write-mode)
  - [InstallIng All Essential Media Codecs](#installing-all-essential-media-codecs)
  - [Installing Jenkins](#installing-jenkins)
  - [Managing startup applications](#managing-startup-applications)
  - [Encryption/decryption via GPG](#encryptiondecryption-via-gpg)
  - [How to Back Up and Restore Your GPG Keys](#how-to-back-up-and-restore-your-gpg-keys)
  - [Using VeraCrypt encrypted volumes](#using-veracrypt-encrypted-volumes)
  - [KeePassXC](#keepassxc)
  - [Encrypting google drive with rclone](#encrypting-google-drive-with-rclone)

## Install and upgrade packages

```sh
# Installing package
sudo apt install ppp
# Checking upgradable list of packages
sudo apt list --upgradable
# Updating only on package
sudo apt --only-upgrade install ppp
man apt
```

## Adding PPA using APT

```sh
# Add
sudo add-apt-repository ppa:PPA_Name/ppa

# Remove
sudo add-apt-repository --remove ppa:PPA_Name/ppa
# OR
sudo rm -i /etc/apt/sources.list.d/PPA_Name.list
```

## Installing Git

```sh
sudo apt update && sudo apt upgrade
sudo apt install git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

```

## Installing necessary packages

```sh
sudo apt install vim curl
```

## Installing flatpak

```sh
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remotes
# Installing bottles
flatpak install flathub com.usebottles.bottles
flatpak run com.usebottles.bottles
```

## Changing TimeOut in GRUB

```sh
sudo vi /etc/default/grub
# Change lines
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=3

sudo update-grub

```

## Repairing boot after install windows

[Boot-Repair](https://help.ubuntu.com/community/Boot-Repair) is a simple tool to repair frequent boot issues you may encounter in Ubuntu like when you can't boot Ubuntu after installing Windows or another Linux distribution, or when you can't boot Windows after installing Ubuntu, or when GRUB is not displayed anymore, some upgrade breaks GRUB, etc.

```sh
# Ubuntu live-USB
sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt update
sudo apt install -y boot-repair && boot-repair

# login windows and run cmd
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi

```

## Adding swap after system installation

```sh
# Adding partion's UUID in file
sudo vi /etc/fstab

# Example for find UUID
sudo blkid /dev/sbd6

```

## Enabling AppImage Support in Ubuntu

```sh
sudo apt install libfuse2
```

## Installing rar/unrar

```sh
sudo apt install rar unrar

# Creating RAR Files with setting password
rar a -p filename.rar filename1
rar a -p dir.rar dir1



# Extract a .rar extension file in specific path
unrar  e filename.rar /home/

# Extract a .rar extension file in their original directory
unrar x filename.rar

# Testing a RAR File
unrar t filename.rar

# More Details
man unrar
man rar

```

## Installing zip/unzip

```sh
sudo apt install zip unzip

#Adding multiple files and directories in the same archive
zip -r archivename.zip directory_name1 directory_name2 file1 file1
# Creating a password protected ZIP file
zip -e  archivename.zip directory_name
# Creating Split Zip File, k (kilobytes), m (megabytes), g (gigabytes), or t (terabytes)
zip -s 1g -r archivename.zip directory_name

# Unzip a password-protected zip file to a different directory
unzip -P PasswOrd filename.zip -d /path/to/directory
```

## Installing tar

```sh
sudo apt install tar
# Compress Files
tar -czvf logs_archive.tar.gz *

# Extract from a compressed file
tar -zxvf logs_archive.tar.gz -C ./log
tar -xJvf logs_archive.tar.xz -C ./log
```

## Installing [Qv2ray](https://github.com/Qv2ray/Qv2ray)

- Download [Qv2ray-v2.7.0-linux-x64.AppImage ](https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-linux-x64.AppImage).
- Download [v2ray](https://github.com/v2fly/v2ray-core) then rename to vcore and place in `~/.config/qv2ray/`.
- Download [QvPlugin-Trojan](https://github.com/Qv2ray/QvPlugin-Trojan/releases) and place in `~/.config/qv2ray/plugins`.

```sh
sudo chmod u+x Qv2ray-v2.7.0-linux-x64.AppImage
./Qv2ray-v2.7.0-linux-x64.AppImage

printenv | grep -i proxy
# no_proxy=localhost,127.0.0.0/8,::1
# ftp_proxy=http://127.0.0.1:8889/
# https_proxy=http://127.0.0.1:8889/
# NO_PROXY=localhost,127.0.0.0/8,::1
# FTP_PROXY=http://127.0.0.1:8889/
# HTTPS_PROXY=http://127.0.0.1:8889/
# HTTP_PROXY=http://127.0.0.1:8889/
# http_proxy=http://127.0.0.1:8889/
# ALL_PROXY=socks://127.0.0.1:1089/
# all_proxy=socks://127.0.0.1:1089/
```

## Setting proxy on sudo

```sh
sudo visudo -f /etc/sudoers.d/NAME
# Add to file NAME
Defaults env_keep += "no_proxy NO_PROXY http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY all_proxy ALL_PROXY"

. ~/.bashrc

# manual set var
export all_proxy=socks5://127.0.0.1:20170/
export ALL_PROXY=socks5://127.0.0.1:20170/
# manual unset var
unset all_proxy && unset ALL_PROXY
```

## Setting proxy on NPM

```sh
npm config set proxy http://username:password@host:port
npm config set https-proxy http://username:password@host:port
# example
npm config set proxy http://127.0.0.1:8889/
npm config set https-proxy http://127.0.0.1:8889/
# Or you can edit directly your ~/.npmrc file:
proxy=http://127.0.0.1:8889/
https-proxy=http://127.0.0.1:8889/

```

## Installing pnpm

```sh
sudo chown -R root:$(whoami) /usr/local/lib/node_modules/
sudo chmod -R 775 /usr/local/lib/node_modules/

corepack enable
corepack prepare pnpm@latest --activate
```

## Installing [V2raya](https://v2raya.org/en/docs/prologue/installation/debian/)

```sh
wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/v2raya.asc
echo "deb https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update
sudo apt install v2raya
sudo systemctl enable v2raya.service
sudo systemctl start v2raya.service
```

## Enabling wayland

[Wayland](https://wayland.freedesktop.org/)is a replacement for the X11 window system protocol and architecture with the aim to be easier to develop, extend, and maintain.

```sh
sudo vi /etc/gdm3/custom.conf
WaylandEnable=true
sudo systemctl restart gdm3
```

[Environment variables for Wayland](https://discourse.ubuntu.com/t/environment-variables-for-wayland-hackers/12750) hackers

```sh
ls $XDG_RUNTIME_DIR/wayland-*
```

## Installing Waydroid

[Waydroid](https://docs.waydro.id/)is a container-based approach to boot a full Android system on a regular GNU/Linux system like Ubuntu.

```sh
sudo apt install curl ca-certificates -y
curl https://repo.waydro.id | sudo bash
sudo apt install waydroid -y

# Launch Waydroid In Full-Screen Mode
sudo waydroid container start
waydroid session start

waydroid show-full-ui
```

[F-Droid](https://f-droid.org/en/) is an installable catalogue of FOSS (Free and Open Source Software) applications for the Android platform. The client makes it easy to browse, install, and keep track of updates on your device.

```sh
# Installing F-Droid
waydroid app install ./F-Droid.apk

# Setting up a shared folder
sudo mount --bind ~/Documents ~/.local/share/waydroid/data/media/0/Documents
```

## Installing Microsoft fonts

```sh
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer
```

## Installing [Docker](https://docs.docker.com/engine/install/ubuntu/)

```sh
curl -fsSL https://get.docker.com | sh
# OR

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#set up the repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update

  # Install Docker Engine, containerd, and Docker Compose.

  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo docker run hello-world

```

## Setting proxy on Docker

```sh
vi ~/.docker/config.json
{
 "proxies": {
   "default": {
     "httpProxy": "http://127.0.0.1:8889/",
     "httpsProxy": "http://127.0.0.1:8889/",
     "noProxy": "localhost,127.0.0.0/8,::1",
     "ftpProxy":"http://127.0.0.1:8889/",
     "allProxy":"socks://127.0.0.1:1089/"
   }
 }
}
```

## Installing Vscode

Download latest package [vscode](https://code.visualstudio.com/download):

```sh
sudo apt install ./code_1.78.0-1683145611_amd64.deb

# Setting/Unsetting proxy via env
printenv | grep -i proxy

unset no_proxy && unset NO_PROXY && unset all_proxy && unset ALL_PROXY && unset ftp_proxy && unset FTP_PROXY && unset http_proxy && unset HTTP_PROXY && unset https_proxy && unset HTTPS_PROXY

export no_proxy=localhost,127.0.0.0/8,::1
export NO_PROXY=localhost,127.0.0.0/8,::1
export ftp_proxy=http://127.0.0.1:8889/
export FTP_PROXY=http://127.0.0.1:8889/
export https_proxy=http://127.0.0.1:8889/
export HTTPS_PROXY=http://127.0.0.1:8889/
export http_proxy=http://127.0.0.1:8889/
export HTTP_PROXY=http://127.0.0.1:8889/
export all_proxy=socks5://127.0.0.1:1089/
export ALL_PROXY=socks5://127.0.0.1:1089/

```

## Installing Bing wallpaper

```sh
sudo snap remove snap-store
sudo snap install snap-store

sudo snap install bing-wall
```

## Installing Pomodoro

```sh
sudo snap install pomatez
```

## Fixing error: download is performed unsandboxed as root...

```sh
sudo chown -Rv _apt:root /var/cache/apt/archives/partial/
sudo chmod -Rv 700 /var/cache/apt/archives/partial/
# sudo apt autoremove
```

## Instaling [TLP](https://linrunner.de/tlp/index.html)

```sh
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw

vi /etc/tlp.conf
#(or a config file of your choice under /etc/tlp.d/):
# example: conservation_mode = 1 > charging stops at 60% | conservation_mode = 0 > the battery gets fully charged (Lenovo Ideapad)
STOP_CHARGE_THRESH_BAT0="1"

sudo systemctl enable tlp
sudo systemctl start tlp

tlp start
tlp-stat -s -c -b
```

## Forwarding all traffic from ssh ([sshuttle](https://github.com/sshuttle/sshuttle))

```sh
sudo apt install sshuttle
sudo sshuttle -r username@sshserver 0/0 --dns
```

## Installing [Minikube](https://minikube.sigs.k8s.io/docs/start/)

```sh
curl -LO https://github.com/kubernetes/minikube/releases/download/v1.30.1/minikube_1.30.1-0_amd64.deb
sudo apt install minikube_1.30.1-0_amd64.deb

sudo usermod -aG docker $USER && newgrp docker

minikube start --driver=docker
minikube config set driver docker


minikube kubectl -- get po -A
echo "alias kubectl='minikube kubectl --'" >> ~/.bash_aliases
source ~/.bashrc

kubectl get po -A

minikube dashboard

# Some dashboard features require the metrics-server addon.
minikube addons enable metrics-server



# Deploy applications

# Type services [Cluster IP, Node Port, Load Balancer, External Name]

kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl get deployments
kubectl describe deployment hello-minikube
kubectl rollout restart deployment hello-minikube
kubectl delete deployment hello-minikube

# Service (Node Port)
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get services hello-minikube
kubectl describe service hello-minikube
minikube service hello-minikube

# http://localhost:7080/
kubectl port-forward service/hello-minikube 7080:8080

kubectl create deployment balanced --image=kicbase/echo-server:1.0
# Service (Load Balancer)
kubectl expose deployment balanced --type=LoadBalancer --port=8080
kubectl get services balanced
# <EXTERNAL-IP>:8080
minikube tunnel

# Ingress
minikube addons enable ingress
kubectl apply -f ingress-example.yaml
kubectl get ingress
# verify that the ingress works
minikube tunnel
curl 127.0.0.1/foo
curl 127.0.0.1/bar

# Manage cluster
minikube pause
minikube unpause
minikube stop

minikube config set memory 9001

minikube addons list

# Delete all of the minikube clusters:
minikube delete --all

minikube delete --purge
```

## Installing [MicroK8s](https://microk8s.io/docs/getting-started)

```sh
# Installing MicroK8s
sudo snap install microk8s --classic --channel=1.27

# Adding current user to the group and gain access to the .kube caching directory
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
#re-enter the session for the group update to take place
su - $USER

# Checking the status
microk8s status --wait-ready

# WARNING:  Docker is installed.
sudo vi /etc/docker/daemon.json
{
    "insecure-registries" : ["localhost:32000"]
}


# Adding alias kubectl
echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases && source ~/.bashrc

# Access Kubernetes
microk8s kubectl get nodes
microk8s kubectl get services

# Use [add-ons](https://microk8s.io/docs/addons#heading--list)
microk8s enable dns
microk8s enable hostpath-storage

# Starting and Stopping MicroK8s
microk8s stop
microk8s start

# Enabling traffic forwarding with:
sudo iptables -P FORWARD ACCEPT
# The change can be made persistent with:
sudo apt-get install iptables-persistent

```

## Install inside virtual environment:

1. cd DIR
2. pipenv install (installs virtual environment and all necessary dependencies from Pipfile).
3. pipenv shell (enter virtual environment).
4. pip install -e . (to install).

## Installing Brave browser

```sh
sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

## Installing Node.js LTS via binary archive

Download the NodeJS : [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

```sh
curl -fsSLO https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
tar -xJvf node-v18.16.0-linux-x64.tar.xz

# --- The First method
sudo cp -r ./node-v18.16.0-linux-x64/{lib,share,include,bin} /usr


# --- The second method
sudo mkdir -p /usr/local/lib/node/v18.16.0
sudo mv ./node-v18.16.0-linux-x64/{lib,share,include,bin} /usr/local/lib/node/v18.16.0
# Checking ~/.bashrc
cat <<EOF >> ~/.bashrc
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
EOF

echo "export PATH=/usr/local/lib/node/v18.16.0/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile

#Zsh
vi ~/.zshrc
export PATH=/usr/local/lib/node/v18.16.0/bin:$HOME/bin:/usr/local/bin:$PATH
# ---


node -v
npm version
```

## Tips

```sh
# Copy just structure folders
rsync -av -f"+ */" --exclude={'*.srt','*.mp4'} "$SRC" "$DEST"
# Adding specific folder in subforlders (leve 1)
cd "$DESTF"
for f in */
do
  if [ -d "$f" ]; then
    mkdir -p "./${f}img"
  fi
done

# How to check gtk version in ubuntu linux
gtk-launch --version
# How do I find the version of bash
echo "${BASH_VERSION}"
bash --version
Ctrl+x Ctrl+v

# logout in /bin/bash
gnome-session-quit --logout --no-prompt
```

## Modifing style properties of GNOME Shell themes

```sh
sudo apt install gnome-shell-extensions gnome-tweaks
```

### Generating custom theme and changing panel background color

```sh

mkdir -p ~/.themes/mytheme/gnome-shell/
echo "#panel {background-color: red;}" > ~/.themes/mytheme/gnome-shell/gnome-shell.css
# Installing extension > GNOME Shell integration
# https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
# Go to https://extensions.gnome.org/extension/19/user-themes/ and enable user-themes
# Launch the Tweaks app and change the GS theme from the “Appearance” tab to Mytheme
# Reload the GNOME shell: <ALT+F2> and input “r”
```

### Extracting original CSS file as a reference

```sh
# default system GS theme located at the “/usr/share/gnome-shell/theme” path
cd /usr/share/gnome-shell/theme/Yaru
gresource list gnome-shell-theme.gresource
gresource extract gnome-shell-theme.gresource /org/gnome/shell/theme/Yaru/gnome-shell-dark.css > output.css
```

## Zsh

[Zsh](https://www.zsh.org/) is a shell designed for interactive use, although it is also a powerful scripting language.

```sh
# Install Zsh
sudo apt install zsh
zsh
```

### Oh my zsh

[Oh My Zsh](https://ohmyz.sh/#install) is a delightful, open source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, themes, and a few things that make you shout...

All the current [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/themes) can be found in the themes/ directory in the Oh My Zsh distribution. [See list here](https://github.com/robbyrussell/oh-my-zsh/tree/master/themes/).

```sh
# ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# echo current shell
echo $SHELL
# Set zsh as your default shell
chsh -s $(which zsh)

cat /etc/shells
## find path to zsh ##
type -a zsh
grep ^USER /etc/passwd
su - USER

open ~/.zshrc
# The list of plugins: "~/.oh-my-zsh/plugins". Each plugin directory has a README file explaining what the plugin does.
plugins=(rails git textmate ruby lighthouse)
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Apply your changes
source ~/.zshrc
```

## Changing Defualt Shell

```sh
# List of Shells
cat /etc/shells

# Change Shell
chsh -s /bin/zsh
# Then logout

# Check
grep "^${USER}" /etc/passwd

su - USER
```

## Remount filesystem in the read-write mode

```sh
touch file1
# check if file system is read only
cat /proc/mounts | grep datastore
mount -v |grep datastore
# check file system by running fsck on its volume
df -h /datastore
fsck /dev/xvdf

# Re-mount file system in read-write mode
mount -o remount,rw /datastore
mount -v |grep datastore

# lists only ext4 file systems:
findmnt -t ext4
# lists information about all available or the specified block devices
lsblk


```

## InstallIng All Essential Media Codecs

The ubuntu-restricted-extras is a software package that consists various essential software like flash plugin, unrar, gstreamer, mp4, codecs for Chromium browser in Ubuntu etc.

```sh
sudo add-apt-repository multiverse
sudo apt update
sudo apt install ubuntu-restricted-extras
```

## Installing Jenkins

[Jenkins](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu) is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software.

Jenkins can be installed through native system packages, Docker, or even run standalone by any machine with a Java Runtime Environment (JRE) installed.

```sh

sudo apt update
sudo apt install openjdk-17-jre
java -version


curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo 'deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/' | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins

sudo systemctl enable --now jenkins
sudo systemctl status jenkins

# Browse to http://localhost:8080
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

## Managing startup applications

- press Alt+F2
- run the gnome-session-properties command.

## Encryption/decryption via GPG

```sh
gpg --full-generate-key
gpg --list-keys
gpg --fingerprint userid
gpg --keyserver keyserver.ubuntu.com --send-key KEY-ID
gpg --keyserver keyserver.ubuntu.com --recv-keys KEY-ID

gpg -se -r recipient file.txt
# --symmetric
gpg -c file.txt

gpg -b file.txt
gpg --verify file.txt.sig

sha1sum file.txt

gpg -d -o file.txt file.txt.gpg

```

## How to Back Up and Restore Your GPG Keys

```sh
tree .gnupg

```

- openpgp-revocs.d: This subdirectory contains your revocation certificate.
- private-keys-v1.d: This subdirectory stores your private keys.
- pubring.kbx: It contains public keys, including yours, and some metadata about them.
- pubring.kbx~: This is a backup copy of "pubring.kbx."
- trustdb.gpg: This holds the trust relationships you have established for your own keys and for any accepted public keys belonging to other people.

```sh
gpg -K --keyid-format LONG

```

- The "sec" (secret) number of bits in the encryption, the key ID, the date the key was created, and "[SC]." The "S" means the key can be used for digital signatures and the "C" means it can be used for certification.
- The next line is the key fingerprint.
- The "uid" line holds the ID of the key's owner.
- The "ssb" line shows the secret subkey, when it was created, and "E." The "E" indicates it can be used for encryption.

```sh
gpg --export --export-options backup -o public.gpg
gpg --export-secret-keys --export-options backup -o private.gpg
gpg --export-ownertrust > trust.gpg

gpg --import public.gpg
gpg --import private.gpg
gpg --import-ownertrust trust.gpg
```

## Using VeraCrypt encrypted volumes

[VeraCrypt](https://veracrypt.fr/en/Documentation.html) is a free open source disk encryption software for Windows, Mac OSX and Linux. Brought to you by IDRIX (https://www.idrix.fr) and based on TrueCrypt 7.1a.

## KeePassXC

Cross-platform Password Manager

```sh
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc
```

## Encrypting google drive with rclone

[Rclone](https://rclone.org/downloads/) is a command-line program to manage files on cloud storage. It is a feature-rich alternative to cloud vendors' web storage interfaces. Over 70 cloud storage products support rclone including S3 object stores, business & consumer file storage services, as well as standard transfer protocols.

```sh
rclone config
rclone config file

mkdir -p ~/path-local-dir
rclone mount crypted-drive-name: ~/path-local-dir
```
