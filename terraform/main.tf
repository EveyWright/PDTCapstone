resource "azurerm_resource_group" "capstone" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_id" "storage_suffix" {
  byte_length = 6
}

resource "azurerm_storage_account" "capstone" {
  name                            = "pdtcapstone${random_id.storage_suffix.hex}"
  resource_group_name             = azurerm_resource_group.capstone.name
  location                        = azurerm_resource_group.capstone.location
  account_kind                    = "BlobStorage"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "disruption_images" {
  name                  = "disruption-images"
  storage_account_id    = azurerm_storage_account.capstone.id
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.capstone.name
}

output "blob_container_url" {
  value = "${azurerm_storage_account.capstone.primary_blob_endpoint}${azurerm_storage_container.disruption_images.name}"
}

# data "azuread_user" "team_members" {
#   for_each            = toset(var.team_member_upns)
#   user_principal_name = each.value
# }

# resource "azurerm_role_assignment" "team_member_rg_access" {
#   for_each             = data.azuread_user.team_members
#   scope                = azurerm_resource_group.capstone.id
#   role_definition_name = "Contributor"
#   principal_id         = each.value.object_id
# }



