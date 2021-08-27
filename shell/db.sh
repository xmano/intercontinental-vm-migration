#!/bin/bash
#  db.sh : Database ops
#  v 1.0 (mano@xkanda.com)
#
# VM Migration (USA>> AUSTRALIA)Using Storage Snapshot through 
# the GCP Internalprivate network in less than 30 minutes
#----------------------------------------------------------------------

# Notes:
# sudo apt update 
# sudo apt-get -y install wget
#  (this gets installed as part of VM startup script)
#----------------------------------------------------------------------

echo "1. Getting wget and wget-ting mysql & sql "$'\n'

mkdir db 
cd db

wget https://storage.googleapis.com/bootcamp-gcp-en/bootcamp-gcp-storage-db-en.sql

wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb 


read -p "Unpacking MySQL. Press Ok to continue... "$'\n' -n1 -s

sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb


echo "2. Installing MySQL server"
echo "   Select default auth plugin"
echo "    - use legacy auth method (MySQL 5.x compat)"
echo "   Password : welcome1"

sudo apt update

sudo apt install mysql-server -y


echo "3. Restarting MySQL service"

sudo systemctl restart mysql.service 


# Final step : Install mysql secure

echo "4. Install mysql secure to complete "$'\n'
echo "   Answer N for security questions... "$'\n'

sudo mysql_secure_installation



