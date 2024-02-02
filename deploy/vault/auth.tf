# Enable Vault auth backend

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

# Creates a Kubernetes auth role for a cloudflared service account to allow generation of tokens to access
resource "vault_kubernetes_auth_backend_role" "cloudflared-role" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "cloudflared-role"
  bound_service_account_names      = ["vault-auth"]
  bound_service_account_namespaces = ["*"] #TODO: Specify
  token_ttl                        = 3600
  token_policies                   = ["cloudflared-policy"]
  audience			   = null
}
