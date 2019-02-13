FROM debian

RUN apt-get update; \
    apt-get -y install mysql-client pwgen python-setuptools curl git unzip apache2 php php-gd libapache2-mod-php wget supervisor curl php-curl php-xmlrpc php-intl php-mysql git-core php-xml php-mbstring php-zip php-soap cron php-ldap php-mysqli; \
    cd /tmp; \
    git clone -b MOODLE_36_STABLE git://git.moodle.org/moodle.git --depth=1; \
    mv /tmp/moodle/* /var/www/html/; \
    rm /var/www/html/index.html; \
    chown -R www-data. /var/www/html; \
    mkdir /var/moodledata; \
    chown -R www-data. /var/moodledata

COPY ./config.php /var/www/html/config.php
COPY ./apache2.conf /etc/apache2/apache2.conf
CMD apache2ctl -D FOREGROUND
