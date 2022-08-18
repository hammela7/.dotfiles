#!/usr/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install git tmux vim htop curl -y
curl -sSL https://get.docker.com | sh
mkdir ~/d
mkdir ~/d/syncthing
