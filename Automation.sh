#!/bin/bash

name=jithendra
timestamp=$(date '+%d%m%Y-%H%M%S')
echo $timestamp
s3bucket=upgrad-jithendra

tar cvzf $name-httpd-logs-$timestamp.tar -P /var/log/apache2/*.log
FILENAME=$name-httpd-logs-$timestamp.tar
FILESIZE=$(stat -c%s "$FILENAME")

mv  $name-httpd-logs-$timestamp.tar /tmp/
aws s3 cp /tmp/$name-httpd-logs-$timestamp.tar s3://$s3bucket/$name-httpd-logs-$timestamp.tar

rm -rf /tmp/$name-httpd-logs-$timestamp.tar

echo "httpd-logs  $timestamp  tar  $FILESIZE"  >> /var/www/html/inventory.html
