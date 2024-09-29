#!/bin/bash
sudo su
yum update -y
yum install httpd -y
service httpd start 
chkconfig httpd on
echo "<html><h1> Hi This is Webserver 1 </h1></html>">/var/www/html/index.html