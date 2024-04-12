# Environment Variables
#
variable "vsphere_username" {}
variable "vsphere_password" {}
#
# Other Variables
#
variable "avi_controller_url" {
  default = "http://10.206.114.108:8000/controller-22.1.6-9191.ova"
}
#
variable "vsphere_server" {
  default = "wdc-06-vc12.oc.vmware.com"
}

variable "vcenter_dc" {
  default = "wdc-06-vc12"
}

variable "vcenter_cluster" {
  default = "wdc-06-vc12c01"
}

variable "vcenter_datastore" {
  default = "wdc-06-vc12c01-vsan"
}

variable "vcenter_network" {
  default = "vxw-dvs-34-virtualwire-3-sid-6120002-wdc-06-vc12-avi-mgmt"
}

variable "vcenter_folder" {
  default = "nic-workshop-ctrl"
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
  default = ["10.206.112.76", "10.206.112.77", "10.206.112.113"]
}

variable "network_mask" {
  default = "255.255.253.0"
}

variable "gateway4" {
  default = "10.206.112.1"
}

variable "avi_cluster" {
  default = true
}

variable "controller" {
  default = {
    cpu = 6
    memory = 24768
    disk = 128
    remove_file = false
  }
}
