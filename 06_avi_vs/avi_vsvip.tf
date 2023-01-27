resource "avi_vsvip" "avi_vsvip" {
  name = "terraform-vip"
  vip {

    placement_networks {
      subnet {
        ip_addr {
          addr = split("/", var.vcenter_network_subnet_cidr)[0]
          type = "V4"
        }
        mask = split("/", var.vcenter_network_subnet_cidr)[1]
      }
      network_ref = data.avi_network.network_vip.id
    }

    vip_id = "0"
    ip_address {
      type = "V4"
      addr = var.vip_ip
    }
  }
  cloud_ref = data.avi_cloud.default_cloud.id
  tenant_ref   = var.tenant
}
