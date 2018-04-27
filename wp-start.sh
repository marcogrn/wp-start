#!/bin/bash

# first make this script executable!
# chmod +x wp-sart.sh

# the domain name is used for naming the project folder 
# es. domainname.com
echo write domain name:
read DOMAIN_NAME

# define the path where inizialize the project
# es. /var/www/
echo whrere is the www path?
read WWW_PATH

# define the owner user of the project
# es. www-data
echo who is the www user?
read WWW_USER

# define the www group
# es. www-data
echo what is the www group?
read WWW_GROUP

# create project directory
mkdir $WWW_PATH/$DOMAIN_NAME
mkdir $WWW_PATH/$DOMAIN_NAME/log
mkdir $WWW_PATH/$DOMAIN_NAME/public_html

# move to the project directory
cd $WWW_PATH/$DOMAIN_NAME/public_html

# download, decompress and move latest wordpress
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz
mv wp-config-sample.php wp-config.php

# verify user, group and permission
chown -R $WWW_USER:$WWW_GROUP .
find . -type d -exec chmod 0755 {} \;
find . -type f -exec chmod 0644 {} \;

# so long and thanks for all the fish
