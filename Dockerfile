FROM alpine:latest
MAINTAINER Sudharsan Rangarajan <sudharsan.rangarajan@gmail.com>

RUN apk update
RUN apk add cgit lighttpd git 

COPY cgit.conf /etc/lighttpd/cgit.conf

RUN echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf
RUN git init --bare /var/git/sample.git
# RUN mkdir /run/openrc
# RUN touch /run/openrc/softlevel
COPY cgitrc /etc/cgitrc
RUN touch /etc/cgitrepos

RUN rm -rf /var/cache/apk/*

EXPOSE 80
VOLUME /var/www
VOLUME /var/git

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]




