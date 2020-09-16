FROM alpine:latest

RUN apk update

ADD docker/repositories /etc/apk/

RUN apk add --no-cache libc6-compat \
&& wget https://dl.grafana.com/oss/release/grafana-7.0.6.linux-amd64.tar.gz \
&& tar -xvf grafana-7.0.6.linux-amd64.tar.gz \
&& mv grafana-7.0.6 grafana \
&& apk add telegraf \
&& mkdir dashboards

ADD docker/telegraf.conf etc/
ADD docker/script.sh /
ADD docker/default.yml /grafana/conf/provisioning/datasources/
ADD docker/dashboard.yml /grafana/conf/provisioning/dashboards/

ADD docker/nginx.json dashboards/
ADD docker/ftps.json dashboards/
ADD docker/grafana.json dashboards/
ADD docker/influxdb.json dashboards/
ADD docker/mysql.json dashboards/
ADD docker/wordpress.json dashboards/
ADD docker/phpmyadmin.json dashboards/

EXPOSE 3000

#CMD sh
CMD sh script.sh
