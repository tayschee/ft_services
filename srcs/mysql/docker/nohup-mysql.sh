#!/bin/sh

until mysql
do
	echo "#"
done

mysql -u root < /root/db-launch.sql
echo "wordpress database initiated"

mysql db_wordpress -u root < /root/mysql.sql
echo "wordpress content uploaded"
