#!/bin/sh

bin=$(cd `dirname $0`; pwd)
pid=$(ps aux | grep tomcat | grep -v grep | grep -v restart | grep ${bin} | awk '{print $2}') 

if [ -n "${pid}" ]; then
    echo "Shutdown..."
    sh /usr/local/tomcat/apache-tomcat-9.0.8/bin/shutdown.sh
    sleep 3

    pid=$(ps aux | grep tomcat | grep -v grep | grep -v restart | grep ${bin} | awk '{print $2}')
    if [ -n "${pid}" ]; then
        kill -9 ${pid}
        sleep 1
    fi
fi

echo "Startup..."
sh /usr/local/tomcat/apache-tomcat-9.0.8/bin/startup.sh
if [ "$1" = "-v" ]; then
    tail -f ${bin}/../logs/catalina.out
fi

