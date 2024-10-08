# Environment Variables
#
variable "vsphere_username" {}
variable "vsphere_password" {}
#
# Other Variables
#
variable "avi_controller_url" {
  default = "http://10.6.248.129:8000/controller-22.1.6-9191.ova"
}
#
variable "vsphere_server" {
  default = "ams-cm2w1-vc1.ams.broadcom.net"
}

variable "vcenter_dc" {
  default = "ams-cm2w1-vc1"
}

variable "vcenter_cluster" {
  default = "ams-cm2w1-vc1-c1"
}

variable "vcenter_datastore" {
  default = "ams-cm2w1-vc1-c1-vsan"
}

variable "vcenter_network" {
  default = "ams-cm2w1-nsx1-avi-mgmt"
}

variable "vcenter_folder" {
  default = "nic-workshop-ctrls"
}

variable "content_library" {
  default = {
    basename = "content_library_tf_"
  }
}

variable "dhcp" {
  default = true
}

variable "avi_ip4_addresses" {
  default = ["1.1.1.2", "1.1.1.3", "1.1.1.4"]
}

variable "network_mask" {
  default = "255.255.255.0"
}

variable "gateway4" {
  default = "1.1.1.1"
}

variable "avi_cluster" {
  default = true
}

variable "controller" {
  default = {
    cpu = 8
    memory = 32768
    disk = 128
    remove_file = false
  }
}