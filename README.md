# terraform-azurerm-route-table

Terraform module to create an **Azure Route Table** with custom routes.

This module follows a **single-responsibility design**:
- ✔ Creates route table
- ✔ Creates routes
- ❌ Does NOT associate with subnets

Subnet association should be handled using a separate module
(e.g. `terraform-azurerm-route-table-association`).
 
---

## Usage (GitHub source)

```hcl
module "route_table" {
  source = "git::https://github.com/<GITHUB_USERNAME>/terraform-azurerm-route-table.git?ref=v1.0.0"
 
  resource_group_name = "rg-example"
  location            = "East US"
  route_table_name    = "example-rt"
 
  routes = [
    {
      name           = "default-to-fw"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.0.4"
    }
  ]
}
````
## 🧰 Inputs

| Name                           | Type           | Required | Description             |
|--------------------------------|----------------|----------|-------------------------|
| `resource_group_name`          | `string`       | yes      | Resource group name     |
| `location`                     | `string`       | yes      | Azure Location          |
| `route_table_name`             | `string`       | yes      | Route table name        |
| `bgp_route_propagation_enable` | `bool`         | no       | Disable BGP propagation |
| `routes`                       | `list(object)` | no       | List of routes          |
| `tags`                         | `map(string)`  | no       | Resource Tags           |


## Resource Object

````
routes = [
  {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.0.4"
  }
]
````
Valid next_hop_type values :
- VirtualAppliance
- Internet
- VnetPeering
- None

## 📤 Outputs
| Name                 | Description                             |
| -------------------- | --------------------------------------- |
| `route_table_id` | Route table ID |
| `route_table_name`             | Route table name       |

## Example (Local Test)
````
cd example/simple
terraform init
terraform plan
terraform apply
````
## Versioning
Always use a tagged version
````
?ref?=v1.0.0
````
