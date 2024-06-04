# tfVmwAviController

## Goal
Terraform | Deploy a brand new Avi Controller (standalone or cluster) in vCenter environment and boostrap it.

## Prerequisites:
- Terraform installed in the orchestrator VM
- environment variables:
```
export TF_VAR_vsphere_username=******
export TF_VAR_vsphere_password=******
export TF_VAR_avi_old_password=******
```
- If you don't know a URL to download Avi, you can always run 'python3 -m http.server' in the folder where you have Avi ova controller downloaded.
- Avi ova controller can be downloaded at support.broadcom.com


## Environment:

Terraform Plan has/have been tested against:

### Terraform

- how to install
```
https://learn.hashicorp.com/tutorials/terraform/install-cli
```

- version tested
```shell
Terraform v1.8.4
on linux_amd64
+ provider registry.terraform.io/hashicorp/local v2.5.1
+ provider registry.terraform.io/hashicorp/null v3.2.2
+ provider registry.terraform.io/hashicorp/random v3.6.2
+ provider registry.terraform.io/hashicorp/vsphere v2.8.1
```

### Avi Version tested

```
controller-22.1.6-9191.ova
```

## Input/Parameters:
- All the variables are stored in each folder in the variables.tf file.

## Use this repo to:
- Spin up n Avi Controller vCenter environment:
  - if var.dhcp is true, VM(s) will obtain IPs through DHCP
  - if var.dhcp is false, VM(s) will obtain IP configuration through:
    - IP(s) via var.avi_ip4_addresses ("10.206.112.55, 10.206.112.56, 10.206.112.57")
    - Netmask via var.network_mask ("255.255.252.0")
    - Gateway via var.gateway4 ("10.206.112.1") 
  - if var.cluster is false, 1 VM controller will be deployed
  - if var.cluster is true, 3 VMs controller will be deployed and configured as a cluster
```shell
git clone https://github.com/tacobayle/tfVmwAviController
cd tfVmwAviController/01_infra
# initialize your variables in variables.tf
terraform init
terraform apply -auto-approve
```
- update admin password:
  - if var.avi_password is defined it will be used to configure Avi password and Avi passphrase
  - if not a random password will be generated and used to configure Avi password and Avi passphrase, it will be displayed at the end
```shell
# initialize your variables in variables.tf
cd ../02_avi_username; terraform init; terraform apply -auto-approve -var-file=../controllers.json
```  
- Configure Avi System config:
  - DNS servers via var.avi_dns_server_ips ("8.8.8.8, 10.206.8.130, 10.206.8.131")
  - NTP servers via var.avi_ntp_server_ips ("10.206.8.130, 10.206.8.131, 10.206.8.132")
```shell  
# initialize your variables in variables.tf
cd ../03_avi_config; terraform init; terraform apply -auto-approve -var-file=../controllers.json -var-file=../.password.json  
```
- Configure Avi cluster (if var.cluster is true):
  - Avi cluster will be configured
  - A sanity check will make sure the cluster has been configured properly  
```shell
# initialize your variables in variables.tf
cd ../04_avi_cluster; terraform init; terraform apply -auto-approve -var-file=../controllers.json  -var-file=../.password.json
```
- Configure Avi cloud  (vcenter type) without IPAM and without DNS profile
  - Avi cloud will be configured
  - Default Service Engine Group will be updated
```shell
# initialize your variables in variables.tf
cd ../05_avi_vcenter_cc; terraform init; terraform apply -auto-approve -var-file=../controllers.json  -var-file=../.password.json
```
- Configure BGP parameters in a VRF
  - BGP will be enabled
  - BGP peers will be configured
```shell
# initialize your variables in variables.tf
cd ../06_vrf_bgp; terraform init; terraform apply -auto-approve -var-file=../controllers.json  -var-file=../.password.json
```
- Configure Avi VS without IPAM and without DNS profile
  - Avi application profile will be configured
  - Avi network profile will be configured
  - Avi pool profile will be configured
  - Avi vs-vip will be configured
  - Avi vs will be configured
```shell
# initialize your variables in variables.tf
cd ../07_avi_vs; terraform init; terraform apply -auto-approve -var-file=../controllers.json  -var-file=../.password.json
```
- Configure Avi VS without IPAM and without DNS profile advertised by BGP
  - Avi application profile will be configured
  - Avi network profile will be configured
  - Avi pool profile will be configured
  - Avi vs-vip will be configured
  - Avi vs will be configured
```shell
# initialize your variables in variables.tf
cd ../07_avi_vs; terraform init; terraform apply -auto-approve -var-file=../controllers.json  -var-file=../.password.json
```