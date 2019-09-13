resource "azurerm_app_service" "backend" {
  name                = "${var.app_name}"
  app_service_plan_id = "${var.serviceplan}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|appsvcsample/python-helloworld:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"         = "false"
    "DOCKER_REGISTRY_SERVER_URL"                  = "https://index.docker.io"
    "ConnectionStrings__DefaultConnectionString"  = "${var.app_connectionstring}" 
  }
}