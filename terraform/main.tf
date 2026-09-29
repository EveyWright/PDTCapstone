resource "azurerm_resource_group" "capstone" {
  name     = var.resource_group_name
  location = var.location
}

data "azuread_user" "team_members" {
  for_each            = toset(var.team_member_upns)
  user_principal_name = each.value
}

resource "azurerm_role_assignment" "team_member_rg_access" {
  for_each             = data.azuread_user.team_members
  scope                = azurerm_resource_group.capstone.id
  role_definition_name = "Contributor"
  principal_id         = each.value.object_id
}



