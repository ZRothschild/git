# ssh

###  SSH是一种网络协议，用于计算机之间的加密登录



### 使用

#### SCP(scp - secure copy (remote file copy program))上传文件与文件加

1. `scp root@192.168.0.101:/var/www/test.txt /var/www/local_dir`
从用`192.168.0.101`服务器的`root`用户下载`test.txt`文件到本地的`/var/www/local_dir`目录

2.  `scp /var/www/test.php  root@192.168.0.101:/var/www/`
把`/var/www/`下面的`test.php`文件上传到`192.168.0.101`服务的`/var/www/`下面

3. `scp -r oot@192.168.0.101:/var/www/test /var/www/local_dir`
从用`192.168.0.101`服务器的`root`用户下载`test`文件夹到本地的`/var/www/local_dir`目录


4.  `scp -r /var/www/test  root@192.168.0.101:/var/www/`
把`/var/www/`下面的`test`文件夹上传到`192.168.0.101`服务的`/var/www/`下面
