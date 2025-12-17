variable "resource_group_name" {
  description = "Resource Group where the route table will be created"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "bgp_route_propagation_enable" {
  description = "Disable BGP route propagation"
  type        = bool
  default     = false
}

variable "routes" {
  description = <<EOF
List of routes to create in the route table.

Each route object supports:
- name (string)
- address_prefix (string) e.g., 0.0.0.0/0
- next_hop_type (string) VirtualAppliance | VnetLocal |Internet | VirtualNetworkGateway | None
- next_hop_in_ip_address (optional string) required when next_hop_type = VirtualAppliance
EOF
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
  default     = {}
}