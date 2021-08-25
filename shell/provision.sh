#!/bin/bash
#  provision.sh : Provision the GCP Infra
#  v 1.0 (mano@xkanda.com)
#  This script implements the provisioning of VMs for Intl VM Migration
#----------------------------------------------------------------------
source "./exports.sh"

# Pre-requisities
#   Ensure Billing is enabled for the project in account management
#   Enable following API inside the project
#     o Cloud Resource Manager API
#     o Compute Engine API
#     o Kubernetes Engine API
#   Ensure you are inside the correct cloud shell project

# A. Set project in GCP Console if not already set 
#   gcloud config set project project_name

#1. Create a VM instance app-01:
echo "Creating compute instance usa-app-01"$'\n'
gcloud compute instances create usa-app-01 --project=$DEVSHELL_PROJECT_ID \
  --zone=us-west1-a --machine-type=n1-standard-1 --subnet=default \
  --scopes="cloud-platform" --tags=http-server,https-server \
  --image=ubuntu-minimal-1604-xenial-v20210119a --image-project=ubuntu-os-cloud \
  --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=app-01

read -p "Please wait for instance to be created. Press any key after completed... "$'\n' -n1 -s 


#2. Create a VM instance app-01:
echo "Creating compute instance app-01"$'\n'
gcloud compute instances create app-01 --project=$DEVSHELL_PROJECT_ID \
  --zone=us-west1-a --machine-type=n1-standard-1 --subnet=default \
  --scopes="cloud-platform" --tags=http-server,https-server \
  --image=ubuntu-minimal-1604-xenial-v20210119a --image-project=ubuntu-os-cloud \
  --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=app-01

read -p "Please wait for instance to be created. Press any key after completed... "$'\n' -n1 -s 

