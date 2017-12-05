#!/bin/bash
cmd=$1
set -x
echo "">total_fd
psid=$(ps -ef|grep ${cmd}|head -1|awk '{print $2}')

count=0 
while [ $count -lt 3000 ] 
do
 lsof -p $psid|wc -l >> total_fd 
 sleep 10 
 count=$(expr $count + 1) 
done