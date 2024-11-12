terraform {
  required_providers {
    avi = {
      source  = "vmware/avi"
      version = "30.2.2"
    }
  }
}

provider "avi" {
  avi_username    = "admin"
  avi_password    = var.avi_password
  avi_controller  = var.avi_controller_ips[0]
  avi_tenant      = "admin"
  avi_version     = var.avi_version
  avi_api_timeout = 50
}
