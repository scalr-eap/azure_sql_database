provider "azurerm" {
    subscription_id = var.scalr_azurerm_subscription_id
    client_id = var.scalr_azurerm_client_id
    client_secret = var.scalr_azurerm_client_secret
    tenant_id = var.scalr_azurerm_tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resourcegroup
  location = var.region
}

resource "azurerm_sql_server" "example" {
  name                         = var.sql__server_name
  resource_group_name          = "${azurerm_resource_group.example.name}"
  location                     = var.region
  version                      = "12.0"
  administrator_login          = var.server_username
  administrator_login_password = var.server_password
}

resource "azurerm_sql_database" "example" {
  name                = var.db_name
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = var.region
  server_name         = "${azurerm_sql_server.example.name}"
}
