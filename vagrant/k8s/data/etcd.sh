#/bin/sh

ETCD_VER=v3.3.11

#choose either URL 下载路径
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

sudo rm -f /data/etcd-${ETCD_VER}-linux-amd64.tar.gz
sudo rm -rf /data/etcd && sudo mkdir -p /data/etcd

sudo curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /data/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /data/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /data/etcd --strip-components=1
sudo rm -f /data/etcd-${ETCD_VER}-linux-amd64.tar.gz

/data/etcd/etcd --version
ETCDCTL_API=3 /data/etcd/etcdctl version

sudo cp /data/etcd/etcd /data/etcd/etcdctl /usr/bin/ && cp /data/etcd.service /lib/systemd/system/
sudo mkdir -p /var/lib/etcd/ /etc/etcd/ && sudo cp /data/etcd.conf /etc/etcd/
sudo systemctl daemon-reload && sudo systemctl start etcd && sudo systemctl enable etcd