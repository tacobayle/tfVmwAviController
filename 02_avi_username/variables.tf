variable "avi_controller_ips" {}
variable "avi_old_password" {}
variable "avi_password" {
  default = null
}
variable "avi_tenant" {
  default = "admin"
}
variable "avi_version" {
  default = "22.1.6"
}