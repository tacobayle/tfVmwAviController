variable "avi_version" {
  default = "30.2.1"
}

variable "avi_dns_server_ips" {
  default = ["10.206.8.130", "10.206.8.131"]
}
variable "avi_ntp_server_ips" {
  default = ["95.81.173.155", "188.165.236.162"]
}
variable "avi_default_license_tier" {
  default = "ENTERPRISE" # or "ENTERPRISE_WITH_CLOUD_SERVICES"
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
variable "avi_controller_ips" {}
variable "avi_password" {}
