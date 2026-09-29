data "azurerm_resource_group" "capstone" {
  name     = var.resource_group_name
}

resource "azuread_application" "github_actions" {
  display_name = "capstone-github-actions"
}

resource "azuread_service_principal" "github_actions" {
  client_id = azuread_application.github_actions.client_id
}

resource "azuread_application_password" "github_actions" {
  application_id = azuread_application.github_actions.id

  display_name = "github-secret"
}

