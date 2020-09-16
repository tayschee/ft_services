FROM alpine:latest

ADD docker/repositories etc/apk

RUN apk update \
&& apk add nginx \
&& apk add openssh \
&& apk add openssl \
&& apk add telegraf \
&& openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
&& mkdir -p /run/nginx \
&& touch /file

RUN adduser -D test \
&& echo "test:test" | chpasswd \
&& ssh-keygen -A

ADD ./docker/default2.conf /etc/nginx/conf.d/default.conf
ADD ./docker/index.html /var/www/localhost/htdocs/
ADD ./docker/telegraf.conf /etc/

EXPOSE 22 80 443

ADD ./docker/script.sh /
ADD ./docker/liveness.sh /

#ENTRYPOINT ["nginx", "-g", "daemon off;"]

#CMD sh
CMD sh script.sh
