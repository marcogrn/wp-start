#!/bin/bash

# setup variables
PROJECT_NAME="domainname.com"
WWW_PATH="/var/www/"
WWW_USER="pvg"
WWW_GROUP="www-data"

echo Hello, write your project name:
read PROJECT_NAME

echo whrere is the www path?
read WWW_PATH

echo who is the www user?
read WWW_USER

echo what is the www group?
read WWW_GROUP

# create directory
mkdir $WWW_PATH/$PROJECT_NAME
mkdir $WWW_PATH/$PROJECT_NAME/log
mkdir $WWW_PATH/$PROJECT_NAME/public_html

# move to the project directory
cd $WWW_PATH/$PROJECT_NAME/public_html

# download latest wordpress
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz
mv wp-config-sample.php wp-config.php

# verify user, group and permission
chown -R $WWW_USER:$WWW_GROUP .
find . -type d -exec chmod 0755 {} \;
find . -type f -exec chmod 0644 {} \;

