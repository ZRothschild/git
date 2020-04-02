1. 查看仪表盘 http://localhost:15672/#/
2. rabbit 是否启动 ps -ef|grep rabbitmq
3. docker run -d --hostname my-rabbit --name rmq -p 15672:15672 -p 5672:5672 -p 25672:25672 -e RABBITMQ_DEFAULT_USER=用户名 -e RABBITMQ_DEFAULT_PASS=密码 rabbitmq:3-management