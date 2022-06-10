resource "avi_systemconfiguration" "avi_system" {
  common_criteria_mode      = false
  uuid                      = "default-uuid"
  welcome_workflow_complete = true
  default_license_tier      = var.avi_default_license_tier
  dns_configuration {
    dynamic server_list {
      for_each = var.avi_dns_server_ips
      content {
        addr = server_list.value
        type = "V4"
      }
    }
    search_domain = var.search_domain #"remo.local"
  }
  email_configuration {
    disable_tls      = var.mail_server_tls #false
    from_email       = var.email
    mail_server_name = var.mail_server      #"localhost"
    mail_server_port = var.mail_server_port #25
    smtp_type        = var.mail_type        #"SMTP_LOCAL_HOST"
  }
  linux_configuration {
    motd   = ""
    banner = var.banner
  }
  global_tenant_config {
    se_in_provider_context       = true
    tenant_access_to_provider_se = true
    tenant_vrf                   = false
  }

  ntp_configuration {
    dynamic ntp_servers {
      for_each = var.avi_ntp_server_ips
      content {
        key_number = 1
        server {
          addr = ntp_servers.value
          type = "V4"
        }
      }
    }
  }
}


resource "avi_backupconfiguration" "backup_config" {
  name       = "Backup-Configuration"
  tenant_ref = var.avi_tenant
  save_local             = true
  maximum_backups_stored = 4
  backup_passphrase      = var.avi_password
  configpb_attributes {
    version = 1
  }
}
