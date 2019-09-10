variable "environment" {
  description = "The prefix used for all resources in this example"
  default = "dev"
}
variable "separator" {
  description = "The separator used for naming the resources"
  default = "-"
}
variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default = "West Europe"
}

variable "rsg_name" {
  description = "Resource Group Name"
  default = "sage"
}

variable "sku_size" {
  description = "SKU Tier"
  default = "S1"
}

variable "sku_tier" {
  description = "SKU Name"
  default = "Standard"
}

variable "app_name" {
  description = "Application Name"
  default = "sage200nces"
}

variable "sqlserver_name" {
  description = "SqlServer Name"
  default = "sages200sqldev"
}

variable "sql_admin_login" {
  description = "SQL Server Administrator Login User"
  default = "sageAdmin"
}
variable "sql_admin_password" {
  description = "SqlServer Administrator Password"
  default = "Pass@w0rd!"
}
variable "database_name" {
  description = "Database Name for the aplication"
  default = "sages200ncdev"
}

