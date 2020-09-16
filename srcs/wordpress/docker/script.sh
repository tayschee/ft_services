export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
php -S 0.0.0.0:5050 -t /wordpress & /usr/bin/telegraf
