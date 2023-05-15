# Tips to do on fresh install of ubuntu desktop

- [Tips to do on fresh install of ubuntu desktop](#tips-to-do-on-fresh-install-of-ubuntu-desktop)
  - [Enabling AppImage Support in Ubuntu](#enabling-appimage-support-in-ubuntu)
  - [Installing Git](#installing-git)
  - [Installing V2raya](#installing-v2raya)


## Enabling AppImage Support in Ubuntu
```sh
sudo apt update && sudo apt upgrade
sudo apt install libfuse2
```
## Installing Git
```sh 
sudo apt install git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

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
