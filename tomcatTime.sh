#! /bin/sh
reset_terminal=$(tput sgro)
function c(){
echo "响应次数:"
grep "controller时间响应时间" /usr/local/tomcat/apache-tomcat-9.0.8/webapps/web/logs/controller/info-log.log |awk '{if($NF>1)print $NF}'|wc -l
}
function s() {
echo "响应10ms的次数:"
grep "db时间响应时间" /usr/local/tomcat/apache-tomcat-9.0.8/webapps/web/logs/controller/info-log.log |awk '{if($NF>1)print $NF}'|wc -l
}




echoFoFun(){
echo -e '\E[32m' "$1" $reset_terminal $2
}
echoFoFun "查询controller 耗时10ms的次数命令加s"
echoFoFun "查询service耗时10ms的次数加c"
$1
