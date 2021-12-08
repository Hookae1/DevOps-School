#!/bin/bash
apt-get update
apt-get -y install apache2
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2> Webserver build by Terraform - Using external script </h2><br> My IP: $myip" > /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2