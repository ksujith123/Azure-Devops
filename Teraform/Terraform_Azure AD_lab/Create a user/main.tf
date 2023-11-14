terraform {
    required_providers {
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 2.41.0"
        }
    }
}

provider "azuread" {
  tenant_id = "a11bc3a9-502f-4f29-92b8-9742641e0c69"
  client_id = "6fa7a39f-2009-4850-be23-ce897c3eba77"
  client_secret = "BsK8Q~7SsL3B9242SHCuArkzLSlc3ZkkC1XIdaFM"
  }

resource "random_password" "pwd" {
    length           = 16
    special          = true
    override_special = "!#$%^&*[]{}()"
}

resource "azuread_user" "create_user" {
    user_principal_name   = "john@ismartsivahydazuregmail.onmicrosoft.com"
    display_name          = "John"
    password              = random_password.pwd.result
    force_password_change = true
    given_name            = "John Miller"
    surname               = "Miller"
}


