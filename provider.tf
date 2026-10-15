provider "azurerm" {
  features {
  }
  subscription_id                 = "0b350b04-f7bc-4060-a575-741c4fcd3bdd"
  environment                     = "public"
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
  resource_provider_registrations = "none"
}
