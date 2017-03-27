FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root



# Installs Apache, PHP and PHPMyAdmin
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y apache2 && \
    apt-get install -y php libapache2-mod-php php-mcrypt php-mysql && \
    apt-get install -y phpmyadmin php-mbstring php-gettext
   
# Add needed repositories
RUN add-apt-repository -y ppa:certbot/certbot && \
    apt-get update
    
# Installs MySQL and configures it 
RUN apt-get install -y mysql-server && \
    service mysql restart && \
    mysqladmin -u root password JRWPassword && \
    phpenmod mcrypt && \
    phpenmod mbstring
  
# Install Certbot
RUN apt-get install -y python-certbot-apache 


# Adds PHPMyAdmin to the Apache configuration
RUN echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

RUN systemctl enable apache2
RUN systemctl enable mysql

# RUN sed -i '/By default this script/a service apache2 restart' /etc/rc.local
# RUN sed -i '/By default this script/a service mysql restart' /etc/rc.local


EXPOSE 80

EXPOSE 443

EXPOSE 3306



