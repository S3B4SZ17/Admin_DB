#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
echo "Updating and installing upgrades and httpd"
sudo yum update -y
sudo yum install -y httpd
echo "Starting the https service"
sudo systemctl start httpd
echo "Enabling the httpd service"
sudo systemctl enable httpd
echo "Copying an html template into the index.html file"
sudo chown -R $USER:$USER /var/www
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
