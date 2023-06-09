# Tips to do on fresh install of ubuntu desktop

- [Tips to do on fresh install of ubuntu desktop](#tips-to-do-on-fresh-install-of-ubuntu-desktop)
  - [Installing Git](#installing-git)
  - [Enabling AppImage Support in Ubuntu](#enabling-appimage-support-in-ubuntu)
  - [Installing rar/unrar](#installing-rarunrar)
  - [Installing Qv2ray](#installing-qv2ray)
  - [Setting proxy on sudo](#setting-proxy-on-sudo)
  - [Installing V2raya](#installing-v2raya)
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


## Installing Git
```sh 
sudo apt update && sudo apt upgrade
sudo apt install git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

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
## Installing [Qv2ray](https://github.com/Qv2ray/Qv2ray)
- Download [Qv2ray-v2.7.0-linux-x64.AppImage ](https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-linux-x64.AppImage). 
- Download [v2ray](https://github.com/v2fly/v2ray-core) then rename to vcore and place in `~/.config/qv2ray/`.
- Download [QvPlugin-Trojan](https://github.com/Qv2ray/QvPlugin-Trojan/releases) and place in ` ~/.config/qv2ray/plugins `.

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





## Installing [V2raya](https://v2raya.org/en/docs/prologue/installation/debian/)

```sh
wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/v2raya.asc
echo "deb https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update
sudo apt install v2raya
sudo systemctl enable v2raya.service
sudo systemctl start v2raya.service
```

## Installing Microsoft fonts
```sh
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer
```

## Installing [Docker](https://docs.docker.com/engine/install/ubuntu/)


```sh
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
```
## Installing Bing wallpaper
```sh
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

```

## Modifing style properties of GNOME Shell themes
```sh
sudo apt install gnome-shell-extensions gnome-tweaks
```
### Generating custom theme and changing panel background color
```sh
mkdir -p ~/.themes/mytheme/gnome-shell/
echo "#panel {background-color: red;}" > ~/.themes/mytheme/gnome-shell/gnome-shell.css
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

# Change your default shell to zsh
chsh -s /usr/bin/zsh
```