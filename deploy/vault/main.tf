# Use Vault provider
provider "vault" {
  # We configure this provider through the
  # environment variables to prevent adding secrets to source control and to parameterise what may change:
  #    - VAULT_ADDR
  #    - VAULT_TOKEN
}
