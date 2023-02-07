resource "avi_applicationprofile" "application_profile" {
  name = "terraform_https_application_profile"
  type = "APPLICATION_PROFILE_TYPE_HTTP"
  http_profile {
    hsts_enabled = true
    secure_cookie_enabled = true
    httponly_enabled = true
    http_to_https = true
    server_side_redirect_to_https = true
    x_forwarded_proto_enabled = true
    compression_profile {
      compression = false
      remove_accept_encoding_header = true
      type = "AUTO_COMPRESSION"
      compressible_content_ref = avi_stringgroup.string_group.id
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
  tenant_ref   = var.tenant
}