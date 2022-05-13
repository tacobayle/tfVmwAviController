variable "avi_username" {
  default = "admin"
}

variable "avi_password" {
}

variable "vcenter_datacenter" {
  default = "wdc-06-vc12"
}

variable "cloud_name" {
  default = "dc1_vcenter"
}
variable "vcenter_network" {
  default = "vxw-dvs-34-virtualwire-3-sid-6120002-wdc-06-vc12-avi-mgmt"
}

variable "vsphere_privilege" {
  default = "WRITE_ACCESS"
}

variable "vsphere_username" {}
variable "vsphere_password" {}

variable "vsphere_server" {
  default = "wdc-06-vc12.oc.vmware.com"
}

variable "avi_version" {
  default = "21.1.4"
}
variable "tenant" {
  default = "admin"
}

variable "avi_license" {
  default = "ENTERPRISE" # or "ENTERPRISE_WITH_CLOUD_SERVICES"
}

variable "vcenter_license_type" {
  default = "LIC_CORES"
}

variable "avi_controller_ips" {}
