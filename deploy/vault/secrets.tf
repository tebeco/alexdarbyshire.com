#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------

# Enable K/V v2 secrets engine at 'secret'. Potential improvement parameterise this and have the path as the domain
resource "vault_mount" "kv-v2" {
  path = "secret"  
  type = "kv-v2"
}

