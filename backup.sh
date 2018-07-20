#!/bin/bash
dt=$(date '+%d.%m.%y %H:%M:%S');
date=$(date '+%d.%m.%y');
time=$(date '+%H:%M:%S')
echo "===== $dt =====" >> backup_log.txt

worlds=(world world_nether world_the_end)
plugins=(BetonQuest BattleLevels DeluxeMenus DivineItemsRPG MythicMobs) #Список папок/файлов типа #1 #2 #3... Без запятых и пр.

mkdir -p ../backup/$date  ../backup/$date/worlds ../backup/$date/plugins #Создание папок ('p' если их нет)

days=7 #Дни
find ../backup/ -type f -mtime +$days -exec rm -f {} \; #Удаление старых бекапов

for file in "${worlds[@]}";
do
	echo "[$time] Делаю копию мира '$file'"
	tar -czf ../backup/$date/worlds/$file-$date.tar.gz $file
done

for file in "${plugins[@]}";
do
	echo "[$time] Делаю копию плагина '$file'"
	tar -czf ../backup/$date/plugins/$file-$date.tar.gz plugins/$file
done
echo "[$time] Копия сервера сделана."