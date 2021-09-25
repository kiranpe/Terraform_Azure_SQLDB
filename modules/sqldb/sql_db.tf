#SQL DB Configuration

resource "azurerm_sql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_login_name
  administrator_login_password = random_string.password.result
}

resource "azurerm_sql_firewall_rule" "sql_firewall" {
  name                = var.firewall_rule_name
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_sql_database" "sql_database" {
  name                = var.database_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = var.database_edition
}

resource "random_string" "password" {
  length  = 20
  special = true
  #override_special = "/@\" "
}
