data "avi_cloud" "default_cloud" {
  name = var.cloud_name
}

data "avi_network" "network_vip" {
  name = var.vcenter_network_vip
  cloud_ref = data.avi_cloud.default_cloud.id
}

data "avi_network" "network_pool" {
  name = var.vcenter_network_pool
  cloud_ref = data.avi_cloud.default_cloud.id
}