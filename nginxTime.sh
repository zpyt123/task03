#!/bin/bash
nginx_log_path="/usr/local/nginx/logs/access.log"
echo "访问次数"
cat ${nginx_log_path} |wc -l 
echo "响应时间"
echo "20ms以内的次数是:"
cat ${nginx_log_path} | awk 'BEGIN{sum=0} {if($NF<0.020)sum++;}END {print sum}'
#根据时间分段统计，使用awk命令自带的if语句和begin，end模块
echo "响应时间为（0.020-0.030ms)之间的次数是:"
cat ${nginx_log_path} | awk 'BEGIN{sum=0} {if(($NF>=0.020)&&($NF<0.030))sum++;}END {print sum}'
echo "响应时间大于30ms小于50ms的次数是:"
cat ${nginx_log_path} | awk 'BEGIN{sum=0} {if(($NF>0.030)&&($NF<0.050))sum++;}END {print sum}'
echo "响应时间大于50ms小于100ms的次数是:"
cat ${nginx_log_path} | awk 'BEGIN{sum=0} {if(($NF>0.050)&&($NF<0.100))sum++;}END {print sum}'
echo "响应时间大于100ms的次数是:"
cat ${nginx_log_path} | awk 'BEGIN{sum=0} {if($NF>0.100)sum++;}END {print sum}'

