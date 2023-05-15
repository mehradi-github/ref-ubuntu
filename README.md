# Tips to do on fresh install of ubuntu desktop

- [Tips to do on fresh install of ubuntu desktop](#tips-to-do-on-fresh-install-of-ubuntu-desktop)
  - [Installing Git](#installing-git)
  - [Enabling AppImage Support in Ubuntu](#enabling-appimage-support-in-ubuntu)
  - [Installing Qv2ray](#installing-qv2ray)
  - [Setting proxy on sudo](#setting-proxy-on-sudo)
  - [Installing V2raya](#installing-v2raya)
  - [Installing Microsoft fonts](#installing-microsoft-fonts)


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
Defaults env_keep += "no_proxy http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY all_proxy NO_PROXY ALL_PROXY"

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