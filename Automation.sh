#!/bin/bash
timestamp=$(date '+%d%m%Y-%H%M%S')
echo $timestamp
s3bucket=upgrad-jithendra
tar cvzf jithendra-httpd-logs-$timestamp.tar -P /var/log/apache2/*.log
mv  jithendra-httpd-logs-$timestamp.tar /tmp/
aws s3 cp /tmp/jithendra-httpd-logs-$timestamp.tar s3://$s3bucket/jithendra-httpd-logs-$timestamp.tar 

