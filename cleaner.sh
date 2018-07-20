#! /bin/bash
i=999999999999999 #Дни
find world/playerdata/ -type f -mtime +$i -exec rm -f {} \;