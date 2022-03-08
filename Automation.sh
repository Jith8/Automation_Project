#!/bin/bash
name=jithendra
timestamp=$(date '+%d%m%Y-%H%M%S')
echo $timestamp
s3bucket=upgrad-jithendra
tar cvzf $name-httpd-logs-$timestamp.tar -P /var/log/apache2/*.log
mv  $name-httpd-logs-$timestamp.tar /tmp/
aws s3 cp /tmp/$name-httpd-logs-$timestamp.tar s3://$s3bucket/$name-httpd-logs-$timestamp.tar 

