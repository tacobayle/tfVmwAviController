terraform {
  required_providers {
    avi = {
      source  = "vmware/avi"
      version = "21.1.3"
    }
  }
}

provider "avi" {
  avi_username   = "admin"
  avi_password   = var.avi_password
  avi_controller = var.avi_controller_ips[0]
  avi_tenant     = var.avi_tenant
  avi_version    = var.avi_version
}
