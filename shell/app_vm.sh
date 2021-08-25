#!/bin/bash
#  app_vm.sh : Configuring VM for App
#  v 1.0 (mano@xkanda.com)
#----------------------------------------------------------------------

echo "1. Getting wget and wget-ting mysql & sql "

sudo apt update 

sudo apt-get install wget zip npm -y 

mkdir vm 

cd vm 

wget https://storage.googleapis.com/bootcamp-gcp-en/bootcamp-gcp-storage-clinic-mid-app.zip


echo "2. Installing the App"

unzip bootcamp-gcp-storage-clinic-mib-app.zip

cd bootcamp-gcp-storage-clinic-mib-app


echo "3. Configuring the App"





