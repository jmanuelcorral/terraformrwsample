resource "azurerm_sql_server" "sqlserver" {
  name                              = "${var.sqlserver_name}"
  resource_group_name               = "${var.resource_group_name}"
  location                          = "${var.location}"
  version                           = "12.0"
  administrator_login               = "${var.admin_login}"
  administrator_login_password      = "${var.admin_password}"
}

resource "azurerm_sql_database" "appdb" {
  name                              = "${var.database_name}"
  resource_group_name               = "${var.resource_group_name}"
  location                          = "${var.location}"
  server_name                       = "${azurerm_sql_server.sqlserver.name}"
  edition                           = "Basic"
  collation                         = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                       = "Default"
  requested_service_objective_name  = "Basic"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_sql_firewall_rule" "fw_connections_todb" {
  name                = "allow-azure-services"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_sql_server.sqlserver.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}