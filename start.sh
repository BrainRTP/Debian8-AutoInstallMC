#!/bin/bash
dt=$(date '+%d.%m.%Y %H:%M:%S');
echo "===== $dt =====" >> restart_log.txt
while true
do
	for ((i=5; i>0; i--));
	do
    	echo "Запуск сервера через '${i}'"
    	sleep 1s
	done
	echo "Заупск...."
	java -Xmx4G -jar spigot.jar
done