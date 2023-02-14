variable "avi_username" {
  default = "admin"
}

variable "avi_password" {}

variable "content_library_id" {}

variable "vcenter_datacenter" {
  default = "sof2-01-vc08"
}

variable "cloud_name" {
  default = "dc1_vcenter"
}
variable "vcenter_network" {
  default = "vxw-dvs-34-virtualwire-3-sid-1080002-sof2-01-vc08-avi-mgmt"
}

variable "vsphere_privilege" {
  default = "WRITE_ACCESS"
}

variable "vsphere_username" {}
variable "vsphere_password" {}

variable "vsphere_server" {
  default = "sof2-01-vc08.oc.vmware.com"
}

variable "avi_version" {
  default = "22.1.3"
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
  default = "Avi_TF_Nic_Workshop"
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