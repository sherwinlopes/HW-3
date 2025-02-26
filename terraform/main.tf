provider "azurerm" {
  features {}
  subscription_id = "c33c0766-83ef-40fc-b9e9-d51bcc4ffca5"
}

resource "azurerm_resource_group" "rg" {
  name     = "react-app-rg"
  location = "Central US"
}

# Updated to use azurerm_service_plan
resource "azurerm_service_plan" "app_plan" {
  name                = "react-app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

# Web App
resource "azurerm_app_service" "app" {
  name                = "react-color-app-12345"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }
}

output "app_url" {
  value = "https://${azurerm_app_service.app.default_site_hostname}"
}