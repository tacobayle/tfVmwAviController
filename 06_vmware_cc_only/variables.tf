variable "avi_username" {
  default = "admin"
}

variable "avi_password" {
}

variable "vcenter_datacenter" {
  default = "RM-DC"
}

variable "cloud_name" {
  default = "vcenter"
}
variable "vcenter_network" {
  default = "DPort-mgmt"
}

variable "vsphere_privilege" {
  default = "WRITE_ACCESS"
}

variable "vsphere_user" {
  default = "remo@rm.ht"
}

variable "vsphere_password" {
}

variable "vsphere_url" {
  default = "vcenter.rm.ht"
}

variable "avi_version" {
  default = "21.1.3"
}
variable "tenant" {
  default = "admin"
}
variable "avi_controller_ips" {
  default = ["192.168.101.5"]
}

variable "avi_license" {
  default = "ENTERPRISE_WITH_CLOUD_SERVICES"
}
variable "vcenter_license_type" {
  default = "LIC_CORES"
}
