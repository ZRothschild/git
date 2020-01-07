#!/usr/bin/env bash

# install some tools
sudo yum install -y git vim gcc glibc-static telnet bridge-utils

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# start docker service
sudo usermod -aG docker vagrant
sudo systemctl start docker.service
sudo systemctl enable docker.service

# install docker-compose
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo rm -rf get-docker.sh