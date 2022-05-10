variable "avi_version" {
  default = "21.1.4"
}
variable "avi_controller_ips" {
   default = ["192.168.101.5"]
}
variable "avi_license" {
  default = "ENTERPRISE_WITH_CLOUD_SERVICES"
}
variable "avi_tenant" {
  default = "admin"
}
variable "avi_password" {
  default = "_c_Az42V"
}
variable "avi_dns_server_ips" {
  default = ["192.168.100.20","1.1.1.1","8.8.8.8"]
}
#max 3 NTP servers
variable "avi_ntp_server_ips" {
  default = "38.229.54.9 , 216.240.36.24"
}
variable "ntp_servers" {
  type    = list(any)
  default = ["0.us.pool.ntp.org", "1.us.pool.ntp.org", "2.us.pool.ntp.org", "3.us.pool.ntp.org"]
}
variable "dns_servers" {
  default = ["192.168.100.20", "1.1.1.1","8.8.8.8"]
}
variable "mail_server_tls" {
  default = false
}
variable "email" {
  default = "admin@avinetworks.com"
}
variable "mail_server" {
  default = "localhost"
}
variable "mail_server_port" {
  default = 25
}
variable "mail_type" {
  default = "SMTP_LOCAL_HOST"
}
variable "banner" {
  default = "Avi Demo with Terraform"
}
variable "search_domain" {
  default = "io.local"
}
variable "avi_version" {}
variable "avi_controller_ips" {}
variable "avi_tenant" {}
variable "avi_password" {}
variable "avi_dns_server_ips" {}
variable "avi_ntp_server_ips" {}
variable "avi_default_license_tier" {}
