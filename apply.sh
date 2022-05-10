#!/bin/bash
#
# Orchestrate TF
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
cd 01_infra
#
# Arcade boolean values
#
#if [[ $TF_VAR_dhcp == "true" || $TF_VAR_dhcp == "false" ]] ; then
#  cp variables.tf.without_boolean varaiables.tf
#  if [[ $TF_VAR_dhcp == "true" ]] ; then
#    tee variables.tf > /dev/null <<EOT
#variable "dhcp" {
#  default = true
#}
#EOT
#  fi
#  if [[ $TF_VAR_dhcp == "false" ]] ; then
#    tee -a variables.tf > /dev/null <<EOT
#variable "dhcp" {
#  default = false
#}
#EOT
#  fi
#  unset TF_VAR_dhcp
#fi
#if [[ $TF_VAR_avi_cluster == "true" || $TF_VAR_avi_cluster == "false" ]] ; then
#  if [[ $TF_VAR_avi_cluster == "true" ]] ; then
#    tee -a variables.tf > /dev/null <<EOT
#variable "avi_cluster" {
#  default = true
#}
#EOT
#  fi
#  if [[ $TF_VAR_avi_cluster == "false" ]] ; then
#    tee -a variables.tf > /dev/null <<EOT
#variable "avi_cluster" {
#  default = false
#}
#EOT
#  fi
#  unset TF_VAR_avi_cluster
#fi
#
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color 2> apply.stderr
tf_apply_check
cd -
#
cd 02_avi_username
#if [ -z "$TF_VAR_avi_version" ]; then
#  sed -i -e 's/version_to_be_replaced/"21.1.3"/g' provider.tf
#else
#  sed -i -e "s/version_to_be_replaced/\"$TF_VAR_avi_version\"/g" provider.tf
#fi
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -compact-warnings 2> apply.stderr
tf_apply_check
cd -
#
cd 03_avi_config
#if [ -z "$TF_VAR_avi_version" ]; then
#  sed -i -e 's/version_to_be_replaced/"21.1.3"/g' provider.tf
#else
#  sed -i -e "s/version_to_be_replaced/\"$TF_VAR_avi_version\"/g" provider.tf
#fi
terraform init -no-color > init.stdout 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json -compact-warnings 2> apply.stderr
tf_apply_check
cd -
#
cd 04_avi_cluster
#if [ -z "$TF_VAR_avi_version" ]; then
#  sed -i -e 's/version_to_be_replaced/"21.1.3"/g' provider.tf
#else
#  sed -i -e "s/version_to_be_replaced/\"$TF_VAR_avi_version\"/g" provider.tf
#fi
terraform init -no-color 2> init.stderr
tf_init_check
terraform apply -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json -compact-warnings 2> apply.stderr
tf_apply_check
cd -
#