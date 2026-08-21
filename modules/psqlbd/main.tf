#
# Database server
#
resource "azurerm_postgresql_flexible_server" "db_server" {
  name                   = "${var.project_name}-pg-server-${var.env}"
  resource_group_name    = var.rgname
  location               = var.location
  administrator_login    = "postgres"
  administrator_password = var.adminpass
  sku_name = "B_Standard_B1ms"
  version = "16"

  delegated_subnet_id = var.subnet_id

  private_dns_zone_id = var.dnszone

  public_network_access_enabled = false

  lifecycle {
    ignore_changes = [ zone ]
  }

}

#
# Postgresql Database
#
resource "azurerm_postgresql_flexible_server_database" "todo_db" {
  name      = "${var.project_name}-db-${var.env}"
  server_id = azurerm_postgresql_flexible_server.db_server.id
}