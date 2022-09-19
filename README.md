# tfVmwAviController

## Goal
Terraform | Deploy a brand new Avi Controller (standalone or cluster) in vCenter environment and boostrap it.

## Prerequisites:
- Terraform installed in the orchestrator VM
- environment variables:
```
export TF_VAR_vsphere_username=******
export TF_VAR_vsphere_password=******
export TF_VAR_avi_controller_url=****** # defines the url where Avi controller OVA image will be downloaded
```
- If you don't know a URL to download Avi, you can always run 'python3 -m http.server' in the folder where you have Avi ova controller downloaded.
- Avi ova controller can be downloaded at customerconnect.vmware.com


## Environment:

Terraform Plan has/have been tested against:

### Terraform

- how to install
```
https://learn.hashicorp.com/tutorials/terraform/install-cli
```

- version tested
```shell
Terraform v1.0.6
on linux_amd64
+ provider registry.terraform.io/hashicorp/null v3.1.0
+ provider registry.terraform.io/hashicorp/template v2.2.0
+ provider registry.terraform.io/hashicorp/vsphere v2.0.2
```

### Avi Version tested

```
controller-21.1.2-9124.ova
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
  - if var.cluster is true, 3 VM controller will be deployed and configured as a cluster
```shell
git clone https://github.com/tacobayle/tfVmwAviController
cd tfVmwAviController/01_infra
# initialize your variables in variables.tf
terraform init
terraform apply -auto-approve
```
- update admin password:
  - if var.avi_password is defined it will be used to configure Avi password and Avi passphrase
  - if var.avi_password is not defined a random password will be generated and used to configure Avi password and Avi passphrase, it will be displayed at the end
```shell
# initialize your variables in variables.tf
cd ../02_avi_username; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json
```  
- Configure Avi System config:
  - DNS servers via var.avi_dns_server_ips ("8.8.8.8, 10.206.8.130, 10.206.8.131")
  - NTP servers via var.avi_ntp_server_ips ("10.206.8.130, 10.206.8.131, 10.206.8.132")
```shell  
# initialize your variables in variables.tf
cd ../03_avi_config; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../.password.json  
```
- Configure Avi cluster (if var.cluster is true):
  - Avi cluster will be configured
  - A sanity check will make sure the cluster has been configured properly  
```shell
# initialize your variables in variables.tf
cd ../04_avi_cluster; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json  -var-file=../.password.json
```
- Configure Avi cloud  (vcenter type) without IPAM and without DNS profile
  - Avi cloud will be configured
  - Default Service Engine Group will be updated
```shell
# initialize your variables in variables.tf
cd ../05_avi_vcenter_cc; terraform init; terraform apply -auto-approve -no-color -var-file=../controllers.json  -var-file=../.password.json
```