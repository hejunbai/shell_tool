#!/bin/bash
cmd=$1
process_num=$(cat /proc[表情]uinfo|grep processor|wc -l)
process_num_now=$(ps -aux|grep ${cmd} |grep -v "grep"|wc|awk '{print $1}')
if [ $process_num == $process_num_now ]; then
	echo "right"
else
	echo "error"
	process_id=$(ps -aux|grep $1 |grep -v "grep"|awk '{print $13}'|sort)
	
	for ((i=1;i<=$process_num;i++));
	do
		isLive=0
		for id in ${process_id[@]};
		do
			if [ $id == $i ]; then
				isLive=1
			fi;	
		done
		
		if [ $isLive == 0 ]; then
			echo $i
			nohup ./$cmd&
		fi;
	done
fi;