#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

variable "blueprint_id" {
  type = string
}

variable "name" {
  type    = string
  default = "Disk Monitor"
}

variable "partition" {
  type        = string
  default     = "/var"
  description = "Disk partition to monitor"
}

variable "remaining_space_low" {
  type        = number
  default     = 20
  description = "Percent value at which the disk utilization is considered _high_."
}

variable "remaining_space_critical" {
  type        = number
  default     = 10
  description = "Percent value at which the disk utilization is considered _full_."
}
