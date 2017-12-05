#!/bin/bash
CWD=`cd $(dirname $0);pwd`

echo $CWD

BIN=$1

ps -ef|grep $BIN|grep -v grep|awk '{ print $2 }'|xargs kill -9

nohup $CWD/$BIN >/dev/null 2>&1 &