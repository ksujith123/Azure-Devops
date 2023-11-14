terraform {
    required_providers {
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 2.15.0"
        }
    }
}

provider "azurerm" {
   subscription_id = "23a877a1-efbc-4daa-a5ae-b052c2161513"
   features {}
}

provider "azuread" {
  tenant_id = "6f3a2c42-b2c9-4c1f-a263-27cfc206a5aa"
  client_id = "2ceef999-4aba-451e-b2e5-e3ac18ba19c2"
  client_secret = "1018Q~zZJMhcO~1zeWdU3GUPR~UObjLoLXJz6cQQ"
  }

# Create an AD Application
resource "azuread_application" "automation" {
 	display_name = "sp-automation"
}

# Create a Service Principal from that Application
resource "azuread_service_principal" "automation" {
 	application_id               = azuread_application.automation.application_id
 	app_role_assignment_required = false
}

# Get information about the configured Azure subscription
data "azurerm_subscription" "primary" {}

# Grant service principal "Contributor" access over the subscription
resource "azurerm_role_assignment" "automation_contributor" {
 scope                = data.azurerm_subscription.primary.id
 role_definition_name = "Contributor"
 principal_id         = azuread_service_principal.automation.object_id
}
