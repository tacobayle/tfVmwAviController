variable "avi_version" {}
variable "avi_controller_ips" {
  default = ["192.168.101.5"]
}
variable "avi_tenant" {}
variable "avi_current_password" {}
variable "avi_password" {
  default = null
}
