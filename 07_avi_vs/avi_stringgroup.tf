data "avi_stringgroup" "string_group" {
  name = "System-Compressible-Content-Types"
}

import {
  to = avi_stringgroup.string_group
  id = data.avi_stringgroup.string_group.id
}

resource "avi_stringgroup" "string_group" {
  name = "System-Compressible-Content-Types"
  kv {
    key = "text/html"
  }
  kv {
    key = "text/xml"
  }
  type = "SG_TYPE_STRING"
  longest_match = false
  tenant_ref   = var.tenant
}

