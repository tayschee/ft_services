export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
cd grafana/bin
./grafana-server & /usr/bin/telegraf 
