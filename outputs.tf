output "route_table_id" {
  description = "ID of the created route table"
  value       = azurerm_route_table.az_rt.id
}

output "route_table_name" {
  description = "Name of the route table"
  value       = azurerm_route_table.az_rt.name
}