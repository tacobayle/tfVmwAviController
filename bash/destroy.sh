#!/bin/bash
cd 07_waf_policy
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../07_avi_vs_no_ssl
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../07_avi_vs_bgp
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../07_avi_vs
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../06_vrf_bgp
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../06_vrf_bgp
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../05_avi_vcenter_cc
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../04_avi_cluster
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../03_avi_config
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../02_avi_username
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
cd ../01_infra
terraform init
terraform destroy -auto-approve -no-color
rm -fr .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup