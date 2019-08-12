#!/bin/sh

#0 Create the security communcation directorty
sudo mkdir /etc/ssl/nginx
cd /etc/ssl/nginx

#1 Get the nginx-repo.crt and nginx-repo.key files


#2 Copy the files to the /etc/ssl/nginx directory
sudo cp nginx-repo.crt /etc/ssl/nginx
sudo cp nginx-repo.key /etc/ssl/nginx

#3 install the required ca-certificates dependency:
sudo yum install ca-certificates

#4 download the nginx-plus-repo files an copy it to the /etc./yum.repos.d/ directory
sudo wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.4.repo


#5 install the nginx-plus package
sudo yum install nginx-plus

#6 To enable the nginx service start at bboot
sudo systemctl enable nginx.service


#(optional) open port 80 and 443 using firewall-cmd
#sudo firewall-cmd --permanent --zone=public --add-service=http
#sudo firewall-cmd --permanent --zone=public --add-service=https
#sudo firewall-cmd --permanent --add-port=80/tcp
#sudo firewall-cmd --permanent --add-port=443/tcp
#sudo firewall-cmd --reload


# test it
sudo ss -tulpn


