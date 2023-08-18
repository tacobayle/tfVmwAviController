resource "avi_cloud" "vmware_cloud_tf" {
  name         = var.cloud_name
  vtype        = "CLOUD_VCENTER"
  dhcp_enabled = true
  vcenter_configuration {
    username                 = var.vsphere_username
    datacenter               = var.vcenter_datacenter
    management_network       = var.vcenter_network
    privilege                = var.vsphere_privilege
    vcenter_url              = var.vsphere_server
    use_content_lib          = true
    content_lib {
      id = var.content_library_id
    }
    password                 = var.vsphere_password
  }
  license_tier = var.avi_license
  license_type = var.vcenter_license_type
  tenant_ref   = var.tenant
}
