#!/bin/bash

#Creating script for generatin mysql_dump
mysqldump --no-tablespaces -u eldark pEld@rk0605 Mysql_db > My_db_dump_"`date +"%Y-%m-%d_%H:%M:%S"`".sql

echo "Don't forget to change the permission by using 'chmod 600'" 
echo "Then create cront task in system for laucnhing this scenario after restartin machine."
echo "Use next command: 'crontab -e'"
echo "Insert row with the command - '@restart sleep 30 && ~/path/to/the/mysql.dump.sh' "
