#!/usr/bin/env bash

curl -L https://studygolang.com/dl/golang/go1.12.linux-amd64.tar.gz
tar xzvf /data/golang/go1.12.linux-amd64.tar.gz -C /usr/local/
sudo rm -f /data/go1.12.linux-amd64.tar.gz

