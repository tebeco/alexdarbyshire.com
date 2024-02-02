# Permit reading of cloudflared path secret/data/cloudflared/tunnel
path "secret/data/cloudflared/*" {
	capabilities = [ "create", "read", "update", "list" ]
}
