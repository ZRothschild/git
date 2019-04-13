# docker 常用命令
## 镜像
### 1.查看
```smartyconfig

//列出所有镜像
docker images 
docker image ls

//显示所有镜像但只列出镜像ID
docker image ls -q
docker imagea -q

```
### 删除
```smartyconfig

//删除指定镜像
docker rmi [OPTIONS] IMAGE [IMAGE...]

//删除所有镜像
docker rmi $(docker imagea -q)

```
## 容器
### 1.查看
```smartyconfig

docker ps   //显示启动容器
docker ps -a   //显示所有容器
docker ps -aq   //显示所有容器但只列出容器ID

```
### 2.进入启动容器
```smartyconfig

docker exec -it  CONTAINER COMMAND [ARG...]  //显示启动容器

```
### 3.删除容器
```smartyconfig

//删除指定容器
docker rm [OPTIONS] IMAGE [IMAGE...]

//删除所有容器
docker rm $(docker imagea -q)

```
### 4.查看容器底层信息
```smartyconfig

docker inspect [OPTIONS] NAME|ID [NAME|ID...]  //显示启动容器

```
## 网络
```smartyconfig

docker network list  //显示所有网络信息

docker network inspect [OPTIONS] NETWORK [NETWORK...]  //查看指定网络信

docker network inspect docker-compose_backends 

```
## 容器编排(docker-compose)
```smartyconfig

//开始存在的容器
docker-compose start [SERVICE...]

//以后台运行模式启动当前文件下面docker-compose.yaml文件配置的服务，
//修改了也可以用此命令启动，为改变的服务不受影响
docker-compose up -d

//重启指定服务，默认重启所有服务
docker-compose restart [options] [SERVICE...]

//停止指定服务，默认停止所有服务
docker-compose stop [options] [SERVICE...]

//删除指定服务，默认删除所有服务 他会询问是否删除，当加上-f时为强制不询问
docker-compose rm [options] [SERVICE...]

//Stops containers and removes containers, networks, volumes, and images created by `up`.
docker-compose down [options]

//进入容器
docker-compose exec zhichi-docker /bin/bash

```
## volume
```smartyconfig

//生成volume
docker volume create [OPTIONS] [VOLUME]

//展示所有volume
docker volume list

//查看卷底层
docker volume inspect [OPTIONS] VOLUME [VOLUME...]

//删除卷
 docker volume rm [OPTIONS] VOLUME [VOLUME...]
 
//删除所有卷
docker volume prune

```
## network网络
```smartyconfig

//生成network
docker network create [OPTIONS] [network]

//展示所有network
docker network list

//查看卷底层
docker network inspect [OPTIONS] network [network...]

//删除卷
 docker volume rm [OPTIONS] network [network...]
 
//删除所有卷
docker network prune

```


