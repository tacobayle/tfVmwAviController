# Environment Variables
#
variable "vsphere_username" {}
variable "vsphere_password" {}
variable "avi_controller_url" {}
#
# Other Variables
#
variable "vsphere_server" {
  default = "sof2-01-vc08.oc.vmware.com"
}

variable "vcenter_dc" {
  default = "sof2-01-vc08"
}

variable "vcenter_cluster" {
  default = "sof2-01-vc08c01"
}

variable "vcenter_datastore" {
  default = "sof2-01-vc08c01-vsan"
}

variable "vcenter_network" {
  default = "vxw-dvs-34-virtualwire-3-sid-1080002-sof2-01-vc08-avi-mgmt"
}

variable "vcenter_folder" {
  default = "nic-workshop-controllers"
}

variable "content_library" {
  default = {
    basename = "content_library_tf_"
  }
}

variable "dhcp" {
  default = false
}

variable "avi_ip4_addresses" {
  default = ["10.41.134.127", "10.41.134.128", "10.41.134.129"]
}

variable "network_mask" {
  default = "255.255.253.0"
}

variable "gateway4" {
  default = "10.41.132.1"
}

variable "avi_cluster" {
  default = false
}

variable "controller" {
  default = {
    cpu = 8
    memory = 24768
    disk = 128
    remove_file = false
  }
}
