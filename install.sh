#!/bin/sh

# configure nginx repo for RHEL 7
vi /etc/yum.repo.d/nginx.repo

################ nginx repo confige ###############
# [ngxinx]
# name=nginx repo
# baseurl=http://nginx.org/packages/mainline/rhel/7/$basearch/
# gpgcheck=0
# enabled=1
################### enf of config ##################

# install the nginx
sudo yum install nginx

# enable the nginx
sudo systemctl enable nginx

# start the nginx
sudo systemctl start nginx

# Check the status of nginx
sudo systemctl status nginx

# change the permission of the nginx floder; thus, later on we can configure it to the way we want.
chown --recursive nginx:ndiabtdtools /etc/nginx


# open port 80 and 443 using firewall-cmd
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload


# test it
sudo ss -tulpn


