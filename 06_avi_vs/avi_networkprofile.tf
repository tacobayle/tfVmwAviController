resource "avi_networkprofile" "network_profile" {
  name = "tf-network-profile"
  profile {
    type = "PROTOCOL_TYPE_TCP_PROXY"
    tcp_proxy_profile {
      ignore_time_wait = false
      time_wait_delay = 2000
      max_retransmissions = 8
      max_syn_retransmissions = 8
      automatic = true
      receive_window = 64
      nagles_algorithm = false
      ip_dscp = 0
      reorder_threshold = 10
      min_rexmt_timeout = 100
      idle_connection_type = "KEEP_ALIVE"
      idle_connection_timeout = 600
      use_interface_mtu = true
      cc_algo = "CC_ALGO_NEW_RENO"
      aggressive_congestion_avoidance = false
      slow_start_scaling_factor = 1
      congestion_recovery_scaling_factor = 2
      reassembly_queue_size = 0
      keepalive_in_halfclose_state = true
      auto_window_growth = true
    }
  }
  connection_mirror = false
  tenant_ref = var.tenant
}
