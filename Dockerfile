FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
    
RUN export DEBIAN_FRONTEND=noninteractive && \
    -E apt-get -q -y install mysql-server && \
    mysqladmin -u root password JRWPassword
    
RUN /etc/init.d/apache2 restart
    
EXPOSE 80

EXPOSE 443

EXPOSE 3306

EXPOSE 22
