data "avi_cloud" "default_cloud" {
  name = var.cloud_name
}

data "avi_network" "network_vip" {
  name = var.vcenter_network
  cloud_ref = data.avi_cloud.default_cloud.id
}