resource "azurerm_resource_group" "main" {
  name     = "${var.rsg_name}${var.environment}"
  location = "${var.location}"
}

module "appinsights" {
  source              = "./modules/appinsights"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  service_name        = "${var.app_name}insights${var.environment}"
} 

module "sqldatabase" {
  source              = "./modules/sqldatabase"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  sqlserver_name        = "${var.sqlserver_name}"
  admin_login           = "${var.sql_admin_login}"
  admin_password        = "${var.sql_admin_password}"
  database_name         = "${var.database_name}"
}

module "serviceplan" {
  source                = "./modules/serviceplan"
  app_name              = "${var.app_name}${var.environment}"
  location              = "${azurerm_resource_group.main.location}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  sku_tier              = "${var.sku_tier}"
  sku_name              = "${var.sku_size}"
}

module "webapp" {
  source                = "./modules/webapp"
  app_name              = "${var.app_name}${var.environment}"
  location              = "${azurerm_resource_group.main.location}"
  serviceplan           = "${module.serviceplan.name}"
  resource_group_name   = "${azurerm_resource_group.main.name}"
  app_connectionstring  = "${module.sqldatabase.connection_string}"
  appinsights_id        = "${module.appinsights.app_id}"
  appinsights_key       = "${module.appinsights.instrumentation_key}"
}