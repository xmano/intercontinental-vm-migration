#!/bin/bash
#  xc_ssh.sh : To SSH into VMs/ launch apps
#  v 1.0 (mano@xkanda.com)
#------------------------------------------------------

source "./exports.sh"

ssh $XC_VM.$XC_REGION.$DEVSHELL_PROJECT_ID
