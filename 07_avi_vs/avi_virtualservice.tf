resource "avi_virtualservice" "https_vs" {
  name                          =  "vsdemo"
  pool_ref                      = avi_pool.pool_tf_vs.id
  tenant_ref                    = "admin"
  vsvip_ref                     = avi_vsvip.avi_vsvip.id
  cloud_ref = data.avi_cloud.default_cloud.id
  application_profile_ref       = avi_applicationprofile.application_profile.id
  network_profile_ref           = avi_networkprofile.network_profile.id
  services {
    port           = var.vs_port
    enable_ssl     = true
  }
}
