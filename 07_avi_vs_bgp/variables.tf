variable "avi_username" {
  default = "admin"
}

variable "avi_password" {}
variable "vsphere_password" {}
variable "avi_controller_ips" {}


variable "vcenter_network_vip" {
  default = "vxw-dvs-34-virtualwire-118-sid-1080117-sof2-01-vc08-avi-dev114"
}

variable "vcenter_network_pool" {
  default = "vxw-dvs-34-virtualwire-117-sid-1080116-sof2-01-vc08-avi-dev113"
}

variable "cloud_name" {
  default = "Default-Cloud"
}

variable "vcenter_network_vip_subnet_cidr" {
  default = "100.64.131.0/24"
}

variable "vcenter_network_pool_subnet_cidr" {
  default = "100.64.130.0/24"
}

variable "vsphere_privilege" {
  default = "WRITE_ACCESS"
}


variable "avi_version" {
  default = "22.1.5"
}

variable "tenant" {
  default = "admin"
}


variable "avi_license" {
  default = "ENTERPRISE"
}
variable "vcenter_license_type" {
  default = "LIC_CORES"
}

variable "pool_name" {
  default = "demo-pool"
}
variable "server_name" {
  default = "100.64.130.203"
}
variable "server_ip" {
  default = "100.64.130.203"
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
  default = "100.64.131.225"
}
variable "vs_port" {
  default = "443"
}