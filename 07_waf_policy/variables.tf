variable "avi_password" {
}

variable "avi_controller_ips" {
  default = ["192.168.101.5"]
}

variable "avi_version" {
  default = "21.1.3"
}
variable "avi_tenant" {
  default = "admin"
}
variable "csr_version" {
  default = "CRS-2021-1" # 21.1.3
  #default = "CRS-2020-3" #20.1.6
}
variable "wafprofile" {
  default = "System-WAF-Profile"
}
