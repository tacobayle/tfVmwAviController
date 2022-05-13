data "avi_tenant" "default_tenant" {
  name =  var.avi_tenant
}
data "avi_networkprofile" "system_tcp_profile" {
  name = var.systemprofile
}
data "avi_cloud" "default_cloud" {
  name = var.cloud_name
}

resource "avi_stringgroup" "stringgroup1" {
  name = var.string_group_name
  kv {
      key = "text/html"
  }
  kv {
      key = "text/xml"
  }
  type = "SG_TYPE_STRING"
  longest_match = false
  tenant_ref = data.avi_tenant.default_tenant.id
}

resource "avi_applicationprofile" "application_profile1" {
  name = "demo_http_application_profile"
  type = "APPLICATION_PROFILE_TYPE_HTTP"
  http_profile {
      hsts_enabled = false
      secure_cookie_enabled = false
      httponly_enabled = false
      http_to_https = false
      server_side_redirect_to_https = false
      x_forwarded_proto_enabled = false
      compression_profile {
        compression = var.compression_setting
        remove_accept_encoding_header = true
        type = "AUTO_COMPRESSION"
        compressible_content_ref = avi_stringgroup.stringgroup1.id
      }
      post_accept_timeout = 30000
      client_header_timeout = 10000
      client_body_timeout = 30000
      keepalive_timeout = 30000
      client_max_header_size = 12
      client_max_request_size = 48
      client_max_body_size = 0
      cache_config {
        enabled = false
        xcache_header = true
        age_header = true
        date_header = true
        min_object_size = 100
        max_object_size = 4194304
        default_expire = 600
        heuristic_expire = false
        max_cache_size = 0
        query_cacheable = false
        aggressive = false
        ignore_request_cache_control = false
    }
  }
  tenant_ref = data.avi_tenant.default_tenant.id
}


resource "avi_pool" "lb_pool" {
  name         = var.pool_name
  lb_algorithm = var.lb_algorithm
  servers {
    ip {
          type = "V4"
      addr = var.server1_ip
    }
    port = var.server1_port
  }
  servers {
    ip {
          type = "V4"
      addr = var.server2_ip
    }
    port = var.server2_port
  }
  cloud_ref =  data.avi_cloud.default_cloud.id
  tenant_ref = data.avi_tenant.default_tenant.id
}

resource "avi_poolgroup" "poolgroup1" {
  name         = var.poolgroup_name
  members {
        pool_ref = avi_pool.lb_pool.id
        ratio = 100
  }
  cloud_ref = data.avi_cloud.default_cloud.id
  tenant_ref = data.avi_tenant.default_tenant.id
}

resource "avi_vsvip" "avi_vsvip_resource" {
  name = "terraform-vip_pool"
  vip {
    vip_id = "0"
    ip_address {
      type = "V4"
      addr = var.avi_terraform_vs_vip
    }
  }
  cloud_ref = data.avi_cloud.default_cloud.id
  tenant_ref = data.avi_tenant.default_tenant.id
}

resource "avi_virtualservice" "http_vs" {
  name                    = var.vs_name
  pool_group_ref          = avi_poolgroup.poolgroup1.id
  tenant_ref              = data.avi_tenant.default_tenant.id
  vsvip_ref               = avi_vsvip.avi_vsvip_resource.id
  application_profile_ref = avi_applicationprofile.application_profile1.id
  network_profile_ref     = data.avi_networkprofile.system_tcp_profile.id #"networkprofile-f5d7399e-008a-4ef6-baa5-0b41d71ee210"
  cloud_ref               = data.avi_cloud.default_cloud.id
  services {
    port       = var.vs_port
    enable_ssl = false
  }
  services {
  enable_http2 =  var.enable_http2
  enable_ssl   = var.enable_ssl
  port         = var.vs_port_1
  }
}
