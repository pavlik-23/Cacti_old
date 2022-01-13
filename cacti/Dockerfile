FROM debian:buster

RUN echo 'deb http://deb.debian.org/debian buster main contrib non-free'  > /etc/apt/sources.list \
	&& echo 'deb-src http://deb.debian.org/debian buster main contrib non-free'  >> /etc/apt/sources.list \
	&& echo 'deb http://deb.debian.org/debian buster-updates main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'deb-src http://deb.debian.org/debian buster-updates main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'deb-src http://deb.debian.org/debian buster-backports main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'deb http://security.debian.org/debian-security/ buster/updates main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'deb-src http://security.debian.org/debian-security/ buster/updates main contrib non-free' >> /etc/apt/sources.list \
	&& echo 'Europe/Chisinau | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -o Acquire::Queue-mode=access install --no-install-recommends -y \
        apt-utils \
	mariadb-server \
	mariadb-client \
	apache2 \
	libapache2-mod-php \
	php-xml \
	php-ldap \
	php-mbstring \
	php-gd \
	php-gmp \
	php-mysql \
	snmp \
	php-snmp \
	rrdtool \
	supervisor \
	librrds-perl

RUN chown -R www-data:www-data /var/www/html/

RUN mkdir /var/log/cacti && touch /var/log/cacti/cacti.log

RUN chown -R www-data:www-data /var/log/cacti

# Define mountable directories.
VOLUME ["/etc/supervisor/conf.d"]

# Define working directory.
WORKDIR /etc/supervisor/conf.d

EXPOSE 80

CMD ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/supervisord.conf"]  
