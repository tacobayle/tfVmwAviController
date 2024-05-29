variable "avi_username" {
  default = "admin"
}

variable "avi_version" {
  default = "30.2.1"
}

variable "tenant" {
  default = "admin"
}

variable "avi_password" {}

variable "cloud_name" {
  default = "Default-Cloud"
}

variable "vcenter_network_vip" {
  default = "vxw-dvs-34-virtualwire-120-sid-6120119-wdc-06-vc12-avi-dev116"
}

variable "vcenter_network_pool" {
  default = "vxw-dvs-34-virtualwire-116-sid-6120115-wdc-06-vc12-avi-dev112"
}

variable "vcenter_network_vip_subnet_cidr" {
  default = "100.64.133.0/24"
}

variable "vcenter_network_pool_subnet_cidr" {
  default = "100.64.129.0/24"
}

variable "avi_controller_ips" {}

variable "pool_name" {
  default = "demo-pool"
}

variable "servers" {
  default = [
    {
      hostname = "100.64.129.203"
      ratio = 1
      enabled = true
      resolve_server_by_dns = false
      addr = "100.64.129.203"
    },
    {
      hostname = "100.64.129.204"
      ratio = 1
      enabled = true
      resolve_server_by_dns = false
      addr = "100.64.129.204"
    }
  ]
}

variable "hostname" {
  default = "www.avi.com"
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
  default = "100.64.133.250"
}

variable "vs_port" {
  default = "443"
}