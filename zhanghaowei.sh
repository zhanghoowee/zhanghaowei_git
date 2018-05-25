#!/bin/bash
file=$1
awk '{print $1}' $1|grep -v *^$* |sort|uniq -c > /data/local/logs/zhanghaowei_$(date +%F).log
exec < /data/local/logs/zhanghaowei_$(date +%F).log
while read line
do 
    ip=`echo $line |awk '{print $2}'`
	count=`echo $line |awk '{print $1}'`
	if [ $count -gt 1 ]
	then
	    echo "$ip" >>/data/local/logs/zhanghaowei_drop_ip_$(date +%F).log
	fi
done


