#!/bin/bash
cd 01_infra ; terraform init ; terraform apply -auto-approve
cd ../02_avi_username; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json
cd ../03_avi_config; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../.password.json
cd ../04_avi_cluster; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json  -var-file=../.password.json
# cd ../05_avi_vcenter_cc; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json  -var-file=../.password.json
