provider "azurerm" {
  features {}
  subscription_id = "c33c0766-83ef-40fc-b9e9-d51bcc4ffca5"
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "centralus"
}

resource "azurerm_static_web_app" "static_app" {
  name                = "myStaticWebApp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
}

output "static_webapp_url" {
  value = azurerm_static_web_app.static_app.default_host_name
}
