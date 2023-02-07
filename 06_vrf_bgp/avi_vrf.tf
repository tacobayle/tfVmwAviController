resource "avi_vrfcontext" "vmware_vrf_tf" {
  name = var.avi_vrf
  cloud_ref = data.avi_cloud.default_cloud.id
  system_default = var.avi_vrf_system_default
  bgp_profile {
    hold_time          = var.bgp_profile.hold_time
    ibgp               = var.bgp_profile.ibgp
    keepalive_interval = var.bgp_profile.keepalive_interval
    local_as           = var.bgp_profile.local_as
    dynamic "peers" {
      for_each = var.bgp_peers
      content {
        advertise_snat_ip      = peers.value.advertise_snat_ip
        advertise_vip          = peers.value.advertise_vip
        advertisement_interval = peers.value.advertisement_interval
        bfd                    = peers.value.bfd
        connect_timer          = peers.value.connect_timer
        ebgp_multihop          = peers.value.ebgp_multihop
        network_ref            = peers.value.network_ref
        peer_ip {
          addr = peers.value.peer_ip.addr
          type = peers.value.peer_ip.type
        }
        remote_as = peers.value.remote_as
        shutdown  = peers.value.shutdown
        subnet {
          ip_addr {
            addr = peers.value.subnet.ip_addr.addr
            type = peers.value.subnet.ip_addr.type
          }
          mask = peers.value.subnet.mask
        }

      }

    }
  }
}