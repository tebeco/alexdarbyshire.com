#---------------------
# Create policies
#---------------------

# Create cloudflared policy in the root namespace
resource "vault_policy" "cloudflared-policy" {
  name   = "cloudflared-policy"
  policy = file("policies/cloudflared-policy.hcl")
}
