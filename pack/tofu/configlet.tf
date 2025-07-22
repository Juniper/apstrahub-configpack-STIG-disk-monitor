#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

locals {
  template_text = <<-EOT
      chassis {
          redundancy {
              graceful-switchover;
          }
          disk-partition %s {
              level full {
                  free-space %d percent;
              }
              level high {
                  free-space %d percent;
              }
          }
      }
  EOT
}

resource "apstra_datacenter_configlet" "a" {
  blueprint_id = var.blueprint_id
  name = var.name
  condition = "role in [\"superspine\", \"spine\", \"leaf\", \"access\"]"
  generators = [
    {
      config_style  = "junos"
      section       = "top_level_hierarchical"
      template_text = format(
        local.template_text,
        var.partition,
        var.remaining_space_critical,
        var.remaining_space_low,
      )
    },
  ]
}
