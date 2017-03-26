FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
    
RUN debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_password' && \
    debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password your_password' && \
    apt-get -y install mysql-server
    
RUN /etc/init.d/apache2 restart
    
EXPOSE 80

EXPOSE 443

EXPOSE 3306

EXPOSE 22
