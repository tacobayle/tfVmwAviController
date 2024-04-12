variable "avi_username" {
  default = "admin"
}

variable "avi_password" {}

variable "vcenter_datacenter" {
  default = "wdc-06-vc12"
}

variable "cloud_name" {
  default = "Default-Cloud"
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
  default = "22.1.5"
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

variable "se_prefix" {
  default = "Avi_RM_SE_AA"
}
variable "mem_per_se" {
  default     = 2048
  description = "for WAF you will need more ram"
}
variable "max_vs_per_se" {
  default     = 20
  description = "max se for this group"
}
variable "max_se" {
  default     = 2
  description = ""
}
variable "connection_mem_percentage" {
  default     = 50
  description = "default"
}
variable "disk_per_se" {
  default     = 25
  description = "default"
}
variable "ha_mode" {
  default = "HA_MODE_SHARED"
}
variable "vcpus_per_se" {
  default     = 2
  description = "How many CPU per SE"
}
variable "deprovision_delay" {
  default = 5
}