FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
    
RUN apt-get install -y mysql-server && \
    mysqladmin -u root password JRWPassword && \
    service mysql start
    
RUN /etc/init.d/apache2 restart
    
EXPOSE 80

EXPOSE 443

EXPOSE 3306

EXPOSE 22
