//local
#module "route_table" {
#  source                       = "../../"
#  resource_group_name          = "rg-example-local"
#  location                     = "East US"
#  route_table_name             = "example-rt"
#  bgp_route_propagation_enable = false

#  routes = [{
#    name                   = "default-to-firewall"
#    address_prefix         = "0.0.0.0/0"
#    next_hop_type          = "VirtualAppliance"
#    next_hop_in_ip_address = "10.0.0.4"
#    },
#    {
#      name           = "default-to-firewall"
#      address_prefix = "0.0.0.0/0"
#      next_hop_type  = "VirtualNetworkGateway"
#    }
#  ]
#  tags = {
#    owner = "DevOpsTerraformLabs"
#    env   = "dev"
#  }
#}


//remote
module "route_table" {
  source                       = "git@github.com:DevOpsTerraformLabs/terraform-azurerm-route-table.git"
  resource_group_name          = "rg-example-remote"
  location                     = "East US"
  route_table_name             = "example-rt"
  bgp_route_propagation_enable = false

  routes = [{
    name                   = "default-to-firewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.0.4"
    },
    {
      name           = "default-to-firewall"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "VirtualNetworkGateway"
    }
  ]
  tags = {
    owner = "DevOpsTerraformLabs"
    env   = "dev"
  }
}