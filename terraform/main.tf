provider "azurerm" {
  features {}
  subscription_id = "c33c0766-83ef-40fc-b9e9-d51bcc4ffca5"
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "centralus"
}

# Static Web App
resource "azurerm_static_web_app" "static_app" {
  name                = "myStaticWebApp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
}

# App Service Plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = "myAppServicePlan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "B1"  # Basic Tier, adjust as needed
  os_type             = "Linux"
}

# Azure Web App
resource "azurerm_linux_web_app" "web_app" {
  name                = "myUniqueWebApp1234"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = true
  }
}

output "static_webapp_url" {
  value = azurerm_static_web_app.static_app.default_host_name
}

output "webapp_url" {
  value = azurerm_linux_web_app.web_app.default_hostname
}
