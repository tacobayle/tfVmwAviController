resource "avi_sslprofile" "ssl_profile" {
  name = "tf-ssl-profile"
  accepted_versions {
    type = "SSL_VERSION_TLS1"
  }
  accepted_versions {
    type = "SSL_VERSION_TLS1_1"
  }
  accepted_versions {
    type = "SSL_VERSION_TLS1_2"
  }
  cipher_enums = [
    "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
    "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
    "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
    "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"
  ]
  type = "SSL_PROFILE_TYPE_APPLICATION"
}
