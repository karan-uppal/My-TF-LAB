#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
cd /var/www/html
echo "<html><h1>my terraform ${env} is working!!</h1></html>" > index.html
echo "<html><h2>DBaddress: ${db_address}</h2></html>" >> index.html
echo "<html><h3>DB port: ${db_port}</h3></html>" >> index.html
echo "<html><h1>healthcheck!!</h1></html>" > error.html