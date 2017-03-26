FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
    
RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password password JRWPassword'
RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password JRWPassword'
RUN apt-get -y install mysql-server
    
RUN /etc/init.d/apache2 restart
    
EXPOSE 80

EXPOSE 443

EXPOSE 3306

EXPOSE 22
