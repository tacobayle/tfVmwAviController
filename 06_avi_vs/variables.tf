variable "avi_username" {
  default = "admin"
}

variable "avi_password" {}
variable "vsphere_password" {}

variable "vcenter_datacenter" {
  default = "wdc-06-vc12"
}

variable "vm_datastore" {
  default = ""
}

variable "cloud_name" {
  default = "dc1_vCenter"
}

variable "vcenter_network" {
  default = "vxw-dvs-34-virtualwire-3-sid-6120002-wdc-06-vc12-avi-mgmt"
}

variable "vcenter_network_subnet_cidr" {
  default = "10.206.112.0/22"
}

variable "vsphere_privilege" {
  default = "WRITE_ACCESS"
}

variable "vsphere_user" {
  default = "aviuser6"
}

variable "vsphere_url" {
  default = "10.206.12.11"
}

variable "avi_version" {
  default = "21.1.3"
}

variable "tenant" {
  default = "admin"
}

variable "avi_controller_ips" {}

variable "avi_license" {
  default = "ENTERPRISE_WITH_CLOUD_SERVICES"
}
variable "vcenter_license_type" {
  default = "LIC_CORES"
}

variable "pool_name" {
  default = "demo-pool"
}
variable "server_name" {
  default = "10.206.114.94"
}
variable "server_ip" {
  default = "10.206.114.94"
}
variable "hostname" {
  default = "me-client"
}
variable "resolve_server_by_dns" {
  default = false
}
variable "realtime_metrics" {
  default = true
}
variable "fail_type" {
  default = "FAIL_ACTION_CLOSE_CONN"
}
variable "default_port" {
  default = "80"
}
variable "rewrite_host_header" {
  default = true
}
variable "vip_ip" {
  default = "10.206.114.154"
}
variable "vs_port" {
  default = "443"
}