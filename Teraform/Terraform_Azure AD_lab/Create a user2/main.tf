terraform {
    required_providers {
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 2.15.0"
        }
    }
}

provider "azuread" {
  tenant_id = "6f3a2c42-b2c9-4c1f-a263-27cfc206a5aa"
  client_id = "a1f12280-110c-4d82-8dd1-1f9487799d01"
  client_secret = "yeJ8Q~SbVGCSJXH46.jVShZlZlIOV.l9PnaLFdkJ"
  }

resource "azuread_user" "pink" {
   user_principal_name = "pink@sivaismart456gmail.onmicrosoft.com"
   display_name        = "Pink Floyd"
   mail_nickname       = "pink"
   password            = "123456789aA#"
}

resource "azuread_user" "bhavya" {
   user_principal_name = "bhavya@sivaismart456gmail.onmicrosoft.com"
   display_name        = "Bhavy Sri"
   mail_nickname       = "bhavya"
   password            = "123456789aA#"
}
