FROM alpine:latest

ADD /docker/repositories etc/apk/
RUN apk update \
&& apk add vsftpd \
&& apk add openssl \
&& adduser -D test \
&& echo "test:test" | chpasswd \
&& apk add telegraf

ADD docker/vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD docker/vsftpd.pem /etc/vsftpd/
ADD docker/fichier_telechargeable /home/test/
ADD docker/script.sh /
ADD docker/telegraf.conf /etc/

EXPOSE 21 20 30020 30021

# ENTRYPOINT /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

#CMD sh
CMD sh script.sh
