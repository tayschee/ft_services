FROM	alpine:latest

ADD ./docker/repositories /etc/apk/

RUN apk update \
&& apk add --no-cache mariadb mariadb-client \
&& apk add telegraf


ADD ./docker/telegraf.conf /etc/
ADD ./docker/nohup-mysql.sh /root/
ADD ./docker/run-mysql /root/
ADD ./docker/db-launch.sql /root/
ADD ./docker/mysql.sql /root/
ADD ./docker/my.cnf /etc/

#RUN chmod 777 /root/mysql.sql

EXPOSE	3306

CMD sh /root/run-mysql
