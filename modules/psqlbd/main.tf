#
# Database server
#
resource "azurerm_postgresql_flexible_server" "db_server" {
  name                   = "${var.project_name}-pg-server-${var.env}"
  resource_group_name    = var.rgname
  location               = var.location
  administrator_login    = var.adminname
  administrator_password = var.adminpass
  sku_name = var.sku
  version = var.bd_version

  delegated_subnet_id = var.subnet_id

  private_dns_zone_id = var.dnszone

  public_network_access_enabled = var.netaccess

  lifecycle {
    ignore_changes = [ zone ]
  }

}

#
# Postgresql Database
#
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = "${var.project_name}-db-${var.env}"
  server_id = azurerm_postgresql_flexible_server.db_server.id
}