resource "avi_pool" "pool_tf_vs" {
  cloud_ref = data.avi_cloud.default_cloud.id
  default_server_port = var.default_port
  #health_monitor_refs = [
  #  avi_healthmonitor.cop_healthmonitor.id,
  #]
  name = var.pool_name

  placement_networks {
    subnet {
      ip_addr {
        addr = split("/", var.vcenter_network_pool_subnet_cidr)[0]
        type = "V4"
      }
      mask = split("/", var.vcenter_network_pool_subnet_cidr)[1]
    }
    network_ref = data.avi_network.network_vip.id
  }

  rewrite_host_header_to_sni = var.rewrite_host_header
  server_name                = var.server_name

  servers {
    hostname              = var.hostname
    ratio                 = 1
    enabled               = true
    resolve_server_by_dns = var.resolve_server_by_dns
    ip {
      addr = var.server_ip
      type = "V4"
    }
  }
    fail_action {
    type = var.fail_type
  }

  analytics_policy {
    enable_realtime_metrics = var.realtime_metrics
  }

  # Specifying an SSL/TLS profile reference for the pool enables TLS to the back-end
  # mTLS will be used to authenticate the Avi SE to the pool members
  #ssl_profile_ref             = avi_sslprofile.cop_sslprofile.id
  #ssl_key_and_certificate_ref = data.avi_sslkeyandcertificate.cop_clientcertificate.id

  #lifecycle {
  #  ignore_changes = [
  #    servers,
  #  ]
  #}
}




