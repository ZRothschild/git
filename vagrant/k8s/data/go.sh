#/bin/sh

ETCD_VER=v3.3.11

#choose either URL 下载路径
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

sudo rm -f /data/go1.11.linux-amd64.tar.gz
sudo rm -rf /usr/local/go

curl -L https://studygolang.com/dl/golang/go1.11.linux-amd64.tar.gz
tar xzvf /data/golang/go1.11.linux-amd64.tar.gz -C /usr/local/
sudo rm -f /data/go1.11.linux-amd64.tar.gz

