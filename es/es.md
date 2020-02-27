1. 是否运行 http://localhost:9200/?pretty
2. 如何找JAVA_HOME  执行ls -lrt /etc/alternatives/java

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME JAVA_BIN PATH CLASSPATH

export JAVA_HOME=/usr/local/java/jdk1.8.0_121
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

case "$1" in
    start)
        cd /elasticsearch/elasticsearch-7.2.0
        ./bin/elasticsearch -d
        !
        echo "elasticsearch startup"
        ;;
    stop)
        es_pid=`ps aux|grep elasticsearch | grep -v 'grep elasticsearch' | awk '{print $2}'`
        kill -9 $es_pid
        echo "elasticsearch stopped"
        ;;
    restart)
        es_pid=`ps aux|grep elasticsearch | grep -v 'grep elasticsearch' | awk '{print $2}'`
        kill -9 $es_pid
        echo "elasticsearch stopped"
        cd /elasticsearch/elasticsearch-7.2.0
        ./bin/elasticsearch -d
        !
        echo "elasticsearch startup"
        ;;
    *)
    echo "start|stop|restart"
    ;;
esac
exit $?