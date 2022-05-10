#!/bin/bash
# check if TF is installed
# check if jq is installed
run_cmd() {
  retry=10
  pause=20
  attempt=0
  while [ $attempt -ne $retry ]; do
    if eval "$@"; then
      break
    else
      echo "$1 FAILED"
    fi
    ((attempt++))
    sleep $pause
    if [ $attempt -eq $retry ]; then
      echo "$1 FAILED after $retry retries" | tee /tmp/cloudInitFailed.log
      exit 255
    fi
    done
}
#
assign_var_from_json_file () {
  rm -f .var
  echo "Select $1..."
  if [[ $(jq length $2) -eq 1 ]] ; then
    echo "defaulting to $(jq -r -c .[0] $2)"
    var=$(jq -r -c .[0] $2)
  else
    count=1
    IFS=$'\n'
    for item in $(jq -c -r .[] $2)
    do
      echo "$count: $item"
      count=$((count+1))
    done
    re='^[0-9]+$' ; yournumber=""
    until [[ $yournumber =~ $re ]] ; do echo -n "$1 number: " ; read -r yournumber ; done
    yournumber=$((yournumber-1))
    var=$(jq -r -c .[$yournumber] $2)
  fi
  echo $var | tee .var >/dev/null
  sleep 2
  clear
}
#
assign_var_boolean () {
  unset var
  until [[ $var == "y" ]] || [[ $var == "n" ]] ; do echo -n "$1 y/n?: " ; read -r var ; done
  if [[ $var == "y" ]] ; then
    contents="$(jq '."'$2'" = true' $3)"
  fi
  if [[ $var == "n" ]] ; then
    contents="$(jq '."'$2'" = false' $3)"
  fi
  echo $contents | tee $3 >/dev/null
  sleep 2
  clear
}
#
tf_init_check () {
  if [ -s init.stderr ] ; then
    echo "TF Init ERRORS:"
    cat init.stderr
    exit 255
  fi
}
#
tf_apply_check () {
  if [ -s apply.stderr ] ; then
    echo "TF Apply ERRORS:"
    cat apply.stderr
    exit 255
  fi
}
#
rm -f booleans.json ; echo "{}" | tee booleans.json >/dev/null
unset vsphere_server ; until [ ! -z "$vsphere_server" ] ; do echo -n "vsphere server FQDN: " ; read -r vsphere_server ; export vsphere_server ; done
unset vsphere_username ; until [ ! -z "$vsphere_username" ] ; do echo -n "vsphere username: " ; read -r vsphere_username ; export vsphere_username ; done
unset vsphere_password ; until [ ! -z "$vsphere_password" ] ; do echo -n "vsphere password: " ; read -s vsphere_password ; echo ; export vsphere_password ; done
run_cmd 'curl https://raw.githubusercontent.com/tacobayle/bash/master/vcenter/get_vcenter.sh -o get_vcenter.sh --silent ; test $(ls -l get_vcenter.sh | awk '"'"'{print $5}'"'"') -gt 0'
/bin/bash get_vcenter.sh $vsphere_server $vsphere_username $vsphere_password
clear
# dc
unset TF_VAR_vcenter_dc ; assign_var_from_json_file "vCenter dc" "datacenters.json" ; TF_VAR_vcenter_dc=$(cat .var) ; export TF_VAR_vcenter_dc
# cluster
unset TF_VAR_vcenter_cluster ; assign_var_from_json_file "vCenter cluster" "clusters.json" ; TF_VAR_vcenter_cluster=$(cat .var) ; export TF_VAR_vcenter_cluster
# datastore
unset TF_VAR_vcenter_datastore ; assign_var_from_json_file "vCenter datastore" "datastores.json" ; TF_VAR_vcenter_datastore=$(cat .var) ; export TF_VAR_vcenter_datastore
# vcenter folder
unset TF_VAR_vcenter_folder ; until [ ! -z "$TF_VAR_vcenter_folder" ] ; do echo -n "enter a folder vCenter name: " ;  read -r TF_VAR_vcenter_folder ; export TF_VAR_vcenter_folder ;  done
clear
# network
unset TF_VAR_vcenter_network ; assign_var_from_json_file "vCenter network" "networks.json" ; TF_VAR_vcenter_network=$(cat .var) ; export TF_VAR_vcenter_network
# management network dhcp
assign_var_boolean "dhcp for vCenter network" "dhcp" "booleans.json"
if [[  $(jq -r .dhcp booleans.json) == false ]] ; then
  unset TF_VAR_avi_ip4_addresses ; until [ ! -z "$TF_VAR_avi_ip4_addresses" ] ; do echo -n "enter 1 (if standalone) or 3 free IPs (if cluster) separated by commas to use in the vCenter network (like: 10.206.112.70, 10.206.112.71, 10.206.112.72): " ; read -r TF_VAR_avi_ip4_addresses ; export TF_VAR_avi_ip4_addresses ; done
  unset TF_VAR_network_mask ; until [ ! -z "$TF_VAR_network_mask" ] ; do echo -n "enter the netmask of vCenter network (like: "255.255.252.0"): " ; read -r TF_VAR_network_mask ; export TF_VAR_network_mask ; done
  unset TF_VAR_gateway4 ; until [ ! -z "$TF_VAR_gateway4" ] ; do echo -n "enter the ip v4 default gateway of vCenter network (like: "10.206.112.1"): " ; read -r TF_VAR_gateway4 ; export TF_VAR_gateway4 ; done
  unset TF_VAR_vcenter_network_mgmt_ipam_pool ; until [ ! -z "$TF_VAR_vcenter_network_mgmt_ipam_pool" ] ; do echo -n "enter a range of at least two IPs for management network separated by hyphen (like: 10.206.112.55 - 10.206.112.57): " ; read -r TF_VAR_vcenter_network_mgmt_ipam_pool ; export TF_VAR_vcenter_network_mgmt_ipam_pool ; done
fi
unset TF_VAR_avi_dns_server_ips ; until [ ! -z "$TF_VAR_avi_dns_server_ips" ] ; do echo -n "enter DNS IPs separated by commas (like: 10.206.8.130, 10.206.8.131): " ; read -r TF_VAR_avi_dns_server_ips ; export TF_VAR_avi_dns_server_ips ; done
unset TF_VAR_avi_ntp_server_ips ; until [ ! -z "$TF_VAR_avi_ntp_server_ips" ] ; do echo -n "enter NTP IPs separated by commas (like: 10.206.8.130, 10.206.8.131): " ; read -r TF_VAR_avi_ntp_server_ips ; export TF_VAR_avi_ntp_server_ips ; done
clear
# Avi version
unset TF_VAR_avi_version ; assign_var_from_json_file "Avi version" "bash/avi_versions.json" ; TF_VAR_avi_version=$(cat .var) ; export TF_VAR_avi_version
# avi url
unset TF_VAR_avi_controller_url ; until [ ! -z "$TF_VAR_avi_controller_url" ] ; do echo -n "Avi download URL: " ; read -r TF_VAR_avi_controller_url ; export TF_VAR_avi_controller_url ; done
# Avi cluster
assign_var_boolean "Avi cluster" "avi_cluster" "booleans.json"
clear
# Avi license
unset TF_VAR_avi_default_license_tier ; assign_var_from_json_file "Avi License" "bash/avi_license.json" ; TF_VAR_avi_default_license_tier=$(cat .var) ; export TF_VAR_avi_default_license_tier
#
#
#
cd 01_infra
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -var-file=../booleans.json 2> apply.stderr
tf_apply_check
cd ..
#
cd 02_avi_username
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../booleans.json -compact-warnings 2> apply.stderr
tf_apply_check
cd ..
#
cd 03_avi_config
terraform init -no-color > init.stdout 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json -compact-warnings 2> apply.stderr
tf_apply_check
cd ..
#
cd 04_avi_cluster
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json -var-file=../booleans.json -compact-warnings 2> apply.stderr
tf_apply_check
cd ..