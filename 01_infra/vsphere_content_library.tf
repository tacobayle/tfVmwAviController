resource "null_resource" "download_avi" {
  provisioner "local-exec" {
    command = "if [ -f $(basename '${var.avi_controller_url}' | sed -e 's/.ova.*/.ova/g' | sed -e 's/^/\\/tmp\\//') ]; then echo \"$(basename '${var.avi_controller_url}' | sed -e 's/.ova.*/.ova/g' | sed -e 's/^/\\/tmp\\//') exists.\" ; else curl --silent -o $(basename '${var.avi_controller_url}' | sed -e 's/.ova.*/.ova/g' | sed -e 's/^/\\/tmp\\//') '${var.avi_controller_url}' ; fi"
  }
}

resource "vsphere_content_library" "library" {
  name            = "${var.content_library.basename}${random_string.id.result}"
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "vsphere_content_library_item" "file" {
  depends_on = [null_resource.download_avi]
  name        = "/tmp/${split(".ova", basename(var.avi_controller_url))[0]}.ova"
  library_id  = vsphere_content_library.library.id
  file_url = "/tmp/${split(".ova", basename(var.avi_controller_url))[0]}.ova"
}

resource "null_resource" "remove_download_avi" {
  depends_on = [vsphere_content_library_item.file]
  count = (var.controller.remove_file == true ? 1 : 0)
  provisioner "local-exec" {
    command = "rm -f $(basename '${var.avi_controller_url}' | sed -e 's/.ova.*/.ova/g' | sed -e 's/^/\\/tmp\\//')"
  }
}
