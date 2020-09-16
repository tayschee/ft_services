FROM alpine:latest

ADD docker/repositories etc/apk

RUN apk update \
&& apk add influxdb \
&& apk add telegraf

ADD docker/script.sh /
ADD docker/telegraf.conf /etc/

EXPOSE 8086

#CMD sh
CMD sh script.sh 
